<?php

namespace App\Database;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Records\Loader\RecordLoader;
use PDOException;

use App\Utilities\Utilitie;
use PDO;

/**
 * Database Class
 *
 * This class provides methods to interact with a MySQL database using PDO.
 * It utilizes the Model and Process traits for efficient data handling and
 * execution of database queries.
 */
class Database
{
    use Model;
    use Process;

    private array  $emtyObject = [];

    /**
     * Save Data
     *
     * Saves data to the database. If the data has an existing primary key,
     * it updates the corresponding record; otherwise, it creates a new record.
     *
     * @return object|bool Cureent irwm of the saved or updated record.
     */
    public function save(): object|bool
    {
        $this->column->updated_at = date(DB_FORMAT . ' h:s');
        $response = $this->column;

        if (is_null($this->conditions)) :

            $uid = $this->create();
            if ($uid) :
                $response->uid = $uid;
                RecordLoader::history("New {$this->tableName} created successfully.{$response->guide}.", 1);
                return $response;
            endif;
        else :

            if ($this->update()) :
                RecordLoader::history("Updated {$this->tableName} successfully.  {$this->conditions[0][2]}.", 1);
                return $response;
            endif;
        endif;

        RecordLoader::history("An error occurred the {$this->tableName}. Please review the data provided and try again.", 0);
        return false;
    }

    /**
     * Create Record
     *
     * Creates a new record in the specified database table.
     *
     * @return int|bool new item of the newly created record.
     */
    public function create(): int|bool
    {
        $db = DatabaseHandler::connect();

        try {
            $columns = "";
            $values = "";
            foreach ($this->column as $key => $column) :
                if (empty($column)) continue;
                $columns .= "`$key`, ";
                $values .= ":$key, ";
            endforeach;

            $columns = rtrim($columns, ", ");
            $values = rtrim($values, ", ");

            $sql = "INSERT INTO `{$this->tableName}` ($columns) VALUES ($values)";

            $stmt = $db->prepare($sql);

            foreach ($this->column as $key => $value) {
                if (empty($value)) continue;
                $stmt->bindValue(":$key", $value);
            }

            if ($stmt->execute()) :
                return $db->lastInsertId(); // Return the ID of the inserted record
            endif;
        } catch (PDOException $e) {
            RecordLoader::history("Apologies, but we're currently experiencing technical difficulties on our server while creating the item. Our team has been notified, and we're working to resolve this issue. Please try again later.", 0);
            RecordLoader::log("Error: " . $e->getMessage(), 500, "BSrxZSqdFh6ry1");
        }

        return false;
    }

    /**
     * Update Record
     *
     * Updates an existing record in the specified database table.
     *
     * @return object|null The ID of the updated record.
     */
    public function update(): object|bool
    {
        // unset($this->column->uid);
        // unset($this->column->guide);
        unset($this->column->created_at);
        unset($this->column->deleted_at);

        $db = DatabaseHandler::connect();

        try {
            $setClause = "";
            foreach ($this->column as $key => $value) {
                if (empty($value)) continue;
                $setClause .= "`$key` = :$key, ";
            }
            $setClause = rtrim($setClause, ", "); // Remove trailing comma

            $sql = "UPDATE `{$this->tableName}`  SET $setClause";

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $this->conditionsString = $this->getConditions();
                $sql .= $this->conditionsString;
            endif;

            $stmt = $db->prepare($sql);

            foreach ($this->column as $key => $value) {
                if (empty($value)) continue;
                $stmt->bindValue(":$key", $value);
            }

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $stmt = $this->setConditions($stmt);
            endif;

            if ($stmt->execute() && $stmt->rowCount() > 0) :
                return true;
            endif;
        } catch (PDOException $e) {
            RecordLoader::history("Oops, we've encountered a server error while updating the item. Our team has been alerted and is actively addressing the issue. Please try your update again later.", 0);
            RecordLoader::log("Error: " . $e->getMessage(), 500, "FTgWffZOchTgZp");
        }
        return false;
    }

    /**
     * Find Record
     *
     * Retrieves a single record from the specified database table based on its ID.
     *
     * @return object|false The associative object representing the retrieved record or null if not found.
     */
    public function find(): object|false
    {
        $sql = $this->generateQuery();

        $result = $this->query($sql);

        if ($result) :
            $response = $result->fetch(PDO::FETCH_OBJ);
            if ($response) :
                $this->column = $response;
                return $response;
            else :
                RecordLoader::history("We're sorry, but we're currently facing difficulties accessing the requested item from the server. Our team is aware of the issue and is actively working on a solution. Please try again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($response), 500, "GVmxj2MZtQP7T7");
            endif;
        endif;

        return false;
    }

    /**
     * Get Records
     *
     * Retrieves multiple records from the specified database table based on conditions.
     *
     * @return object An object of associative objects representing the retrieved records.
     */
    public function get(): object
    {
        $sql = $this->generateQuery();

        $result = $this->query($sql);

        if ($result) :

            $response = $result->fetchAll(PDO::FETCH_OBJ);

            if ($response) :
                // Create and return an object with response data
                return $this->getResponse($response);
            else :
                RecordLoader::history("We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($result), 500, "jjrUbFpPCKOmxg");
                return (object) $this->emtyObject;
            endif;
        endif;

        return (object) $this->emtyObject;
    }

    /**
     * Find Records with Join
     *
     * Retrieves records from multiple tables using a JOIN operation based on specified conditions.
     *
     * @return object|false An object of associative objects representing the retrieved records.
     */
    public function findJoin(): object|false
    {

        $sql = $this->generateQuery('join');

        $sql .= $this->generateJoin();

        $result = $this->query($sql);

        if ($result) :
            $response = $result->fetch(PDO::FETCH_OBJ);

            if ($response) :
                return $response;
            else :
                RecordLoader::history("Oops, we've encountered a server error while updating the item. Our team has been alerted and is actively addressing the issue. Please try your update again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($response), 500, "4zDbqYzFKbkDte");
            endif;
        endif;

        return false;
    }

    /**
     * Join Tables
     *
     * Performs a JOIN operation on multiple tables based on specified conditions.
     *
     * @return object An object of associative objects representing the result of the JOIN operation.
     */
    public function join(): object
    {

        $sql = $this->generateQuery('join');

        $sql .= $this->generateJoin();

        $result = $this->query($sql);

        if ($result) :

            $response = $result->fetchAll(PDO::FETCH_OBJ);

            if ($response) :
                return $this->getResponse($response);
            else :
                RecordLoader::history("We're sorry, but we're currently facing difficulties accessing the requested item from the server. Our team is aware of the issue and is actively working on a solution. Please try again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($result), 500, "TU87eFBZEvjJkO");
                return (object) $this->emtyObject;
            endif;
        endif;

        return (object) $this->emtyObject;
    }

    /**
     * Find Records with Grouping
     *
     * Retrieves records from the specified database table with GROUP BY operation based on specified conditions.
     *
     * @return object|false An object of associative objects representing the retrieved records.
     */
    public function findGroup(): object|false
    {
        // group
        $sql = $this->generateQuery('group');

        $sql .= $this->generateJoin();

        $result = $this->query($sql, " GROUP BY `{$this->tableName}`.`uid` ");

        if ($result) :
            $response = $result->fetch(PDO::FETCH_OBJ);

            if ($response) :
                return $response;
            else :
                RecordLoader::history("Oops, we've encountered a server error while updating the item. Our team has been alerted and is actively addressing the issue. Please try your update again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($response), 500, "RDCxSrsHgR1QNh");
            endif;
        endif;

        return false;
    }

    /**
     * Group Records
     *
     * Performs a GROUP BY operation on records from the specified database table based on specified conditions.
     *
     * @return object An object of associative objects representing the result of the GROUP BY operation.
     */
    public function group(): object
    {
        // group
        $sql = $this->generateQuery('group');

        $sql .= $this->generateJoin();

        $result = $this->query($sql, " GROUP BY `{$this->tableName}`.`uid` ");

        if ($result) :

            $response = $result->fetchAll(PDO::FETCH_OBJ);

            if ($response) :

                // Create and return an object with response data
                return $this->getResponse($response);
            else :
                RecordLoader::history("We're sorry, but we're currently facing difficulties accessing the requested item from the server. Our team is aware of the issue and is actively working on a solution. Please try again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($result), 500, "1P6GlZZvGeJlIl");
                return (object) $this->emtyObject;
            endif;
        endif;

        return (object) $this->emtyObject;
    }

    /**
     * Delete Record
     *
     * Deletes a record from the specified database table based on its ID.
     *
     * @return bool True if the record is successfully deleted, false otherwise.
     */
    public function delete($need = false): bool
    {
        if (is_null($this->conditions)) return false;

        $db = DatabaseHandler::connect();

        try {
            if ($need) :
                $sql = "UPDATE `{$this->tableName}` SET `deleted_at` = null";
            else :
                $sql = "UPDATE `{$this->tableName}` SET `deleted_at` = NOW()";
            endif;

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $this->conditionsString = $this->getConditions();
                $sql .= $this->conditionsString;
            endif;

            $stmt = $db->prepare($sql);

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $stmt = $this->setConditions($stmt);
            endif;

            return $stmt->execute(); // Return true on success, false on failure
        } catch (PDOException $e) {
            RecordLoader::history("We regret to inform you that we're currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.", 0);
            RecordLoader::log("Error: " . $e->getMessage(), 500, "wnSYckBjudSsNh");
        }

        return false;
    }

    /**
     * Delete Record (Alias)
     *
     * Deletes a record from the specified database table based on its ID.
     * This method serves as an alias for the `delete` method.
     *
     * @return bool True if the record is successfully deleted, false otherwise.
     */
    public function destroy()
    {
        if (is_null($this->conditions)) return;

        $db = DatabaseHandler::connect();

        try {
            $sql = "DELETE FROM `{$this->tableName}` ";

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $this->conditionsString = $this->getConditions();
                $sql .= $this->conditionsString;
            endif;

            $stmt = $db->prepare($sql);

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $stmt = $this->setConditions($stmt);
            endif;

            return $stmt->execute(); // Return true on success, false on failure
        } catch (PDOException $e) {
            RecordLoader::history("We regret to inform you that we're currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.", 0);
            RecordLoader::log("Error: " . $e->getMessage(), 500, "PTtkYxmbkn8FsJ");
        }

        return false;
    }

    /**
     * Analyze Database
     *
     * Performs analysis on the specified database, providing insights into its structure and performance.
     *
     * @return object An object containing information about the database analysis.
     */
    public function countlist(): object | bool
    {
        return $this->getList();
    }


    public function getAnalysis(): object | bool
    {
        if (is_null($this->analysis)) return false;
        $db = DatabaseHandler::connect();

        try {
            $sql = "SELECT {$this->analysis['select']} FROM `{$this->tableName}`";

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $this->conditionsString = $this->getConditions();
                $sql .= $this->conditionsString;
            endif;

            if (isset($this->analysis['where'])) :
                $sql .= " {$this->analysis['where']} ";
            endif;

            if (isset($this->analysis['group'])) :
                $sql .= " GROUP BY {$this->analysis['group']} ";
            endif;

            if (isset($this->analysis['order'])) :
                $sql .= " ORDER BY {$this->analysis['order']} " . $this->analysis['dir'] ?? 'DESC';
            endif;

            $this->sqlQuery = $sql;

            $stmt = $db->prepare($sql);

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $stmt = $this->setConditions($stmt);
            endif;

            if ($stmt->execute() && $stmt->rowCount() > 0) :
                $response = $stmt->fetchAll(PDO::FETCH_ASSOC);
                // Create and return an object with response data
                return $this->getResponse($response);

            else :
                RecordLoader::history("We apologize, but there is an issue with accessing the requested items from the server. Our team is aware of the problem and is actively working on a resolution. Please try accessing the items again later.", 0);
                RecordLoader::log("Query preparation failed: " . json_encode($stmt), 500, "jjrUbFpPCKOmxg");
                return (object) $this->emtyObject;
            endif;
        } catch (PDOException $e) {
            RecordLoader::history("We regret to inform you that we're currently experiencing a technical issue while trying to delete the item. Our team is already investigating the problem and is actively working to resolve it. Please try the deletion process again later.", 0);
            RecordLoader::log("Error: " . $e->getMessage(), 500, "PTtkYxmbkn8FsJ");
        }

        return false;
    }
}
