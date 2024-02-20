<?php

namespace App\Database;

use PDO;
use PDOException;
use App\Utilities\Utilitie;
use App\Modules\Records\Loader\RecordLoader;

class Migrate extends DatabaseHandler
{
    use Model;

    /**
     * Check if Table Exists
     *
     * Checks if a table exists in the database.
     *
     * @param string $tableName The name of the table to check.
     *
     * @return bool|string True if the table exists, false otherwise.
     */
    static function tableIsExist(string $tableName): bool | string
    {
        $connection = DatabaseHandler::connect();

        // Check if the table 'tableName' exists
        $query = "SHOW TABLES LIKE '{$tableName}'";
        $result = $connection->query($query);
        if ($result->rowCount() > 0) :
            return $tableName;
        endif;

        return false;
    }

    /**
     * Build Table from Model Object
     *
     * Builds a database table based on the structure defined in the corresponding Model object.
     *
     * @param string $tableName The name of the table to be created.
     * @param array $columns     The Model array representing the table structure.
     * @param array $key     The Model array .
     *
     * @return bool True if the table is successfully created, false otherwise.
     */
    static function building(string $tableName, array $columns, array $key = null)
    {
        $connection = DatabaseHandler::connect();

        if (!self::tableIsExist($tableName)) :
            $createTableQuery = "CREATE TABLE `{$tableName}` (
                `uid` INT(11) NOT NULL AUTO_INCREMENT,
                `guide` CHAR(14) NOT NULL,";

            foreach ($columns as $columnName => $columnType) :
                $createTableQuery .= "`$columnName` $columnType, ";
            endforeach;

            $createTableQuery .= "`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                `deleted_at` DATETIME DEFAULT NULL,
                PRIMARY KEY (`uid`),
                UNIQUE KEY `guide` (`guide`) USING BTREE";

            if (!is_null($key)) :
                foreach ($key as $columnName => $columnType) :
                    $createTableQuery .= ", $columnType ";
                endforeach;
            endif;

            $createTableQuery .= ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;";

            try {
                // Table does not exist; create it
                $connection->exec($createTableQuery);
                RecordLoader::history("Great news! We've just added a {$tableName} new module to the app. Explore the exciting features and functionality it brings to enhance your experience.", 1);
                RecordLoader::log("added {$tableName} table", 200, "Aow3OtlEDqArEM");
            } catch (PDOException $e) {
                RecordLoader::history("We apologize for the inconvenience, but we've encountered a server-related issue with the new module. Our team is actively working to resolve this problem and ensure a smooth experience. We appreciate your patience and understanding.", 0);
                RecordLoader::log("Error {$tableName}: " . $e->getMessage(), 500, "ijuM0Bjd7Yendz");
                return false;
            }
        endif;

        return true;
    }

    /**
     * Insert Default Rows
     *
     * Inserts default rows into the specified database table.
     *
     * @param string $tableName The name of the table to insert rows into.
     * @param array $dataToInsert       
     * @param array $format       
     *
     * @return bool True if the default rows are successfully inserted, false otherwise.
     */
    static function insert($tableName, $dataToInsert, $format)
    {
        $connection = DatabaseHandler::connect();

        // Create an array of placeholders for the values to be inserted
        $valuePlaceholders = array_fill(0, count($format), '?');

        // Combine the column names and value placeholders into an SQL INSERT statement format
        $insertStatement = '(' . implode(', ', $format) . ') VALUES (' . implode(', ', $valuePlaceholders) . ')';

        try {
            // Start a transaction
            $connection->beginTransaction();


            // Loop through the data and insert each row
            foreach ($dataToInsert as $data) {
                $stmt = $connection->prepare("INSERT INTO `$tableName` $insertStatement");
                $stmt->execute($data);
            }

            // Commit the transaction if all inserts are successful
            $connection->commit();

            RecordLoader::log("inserted " . count($dataToInsert) . " default data in {$tableName} table", 200, "oKFxXlu65OLVwq");

            return true;
        } catch (PDOException $e) {
            // An error occurred; roll back the transaction
            $connection->rollBack();
            RecordLoader::log("Error: " . $e->getMessage(), 500, "3IzcJzluUSV8o8");
            return false;
        }
    }

    /**
     * Update Table Columns
     *
     * Updates the columns of a database table, adding or removing columns based on the provided structure.
     *
     * @param string $tableName The name of the table to be updated.
     * @param array $columns     
     * @param array $toUpdate     
     *
     * @return bool True if the table columns are successfully updated, false otherwise.
     */
    static function tableUpdating(string $tableName, array $columns, array $toUpdate = [])
    {
        $connection = DatabaseHandler::connect();

        try {

            // Get a list of column names in the table
            $getTableName = $connection->query("SHOW COLUMNS FROM `$tableName`");
            $actualColumns = $getTableName->fetchAll(PDO::FETCH_COLUMN);

            // Check for columns to create
            foreach ($columns as $column => $setting) :
                if (!in_array($column, $actualColumns)) :
                    $sql = "ALTER TABLE `$tableName` ADD `$column` $setting";
                    $connection->exec($sql);
                endif;
            endforeach;

            // Check for columns to delete
            foreach ($actualColumns as $column) :
                if (!array_key_exists($column, $columns) && !key_exists($column, self::$defaultColumns)) :
                    $sql = "ALTER TABLE `$tableName` DROP `$column`";
                    $connection->exec($sql);
                endif;
            endforeach;

            // Your code for updating columns goes here
            foreach ($toUpdate as $column => $values) :
                $oldValue = $values[0];
                $newValue = $values[1];

                // Construct the SQL query to update the column with the new value
                $sql = "UPDATE `$tableName` SET `$column` = :newValue WHERE `$column` = :oldValue";

                // Prepare the SQL statement
                $stmt = $connection->prepare($sql);

                // Bind values for updating
                // TODO auto filter by PDO::PARAM_STR
                $stmt->bindParam(':oldValue', $oldValue);
                $stmt->bindParam(':newValue', $newValue);

                // Execute the SQL statement
                $stmt->execute();
            endforeach;

            RecordLoader::log("Updated the columns of table", 200, "sdf56sd7f65");
            return true;
        } catch (PDOException $e) {
            // Log or handle the error as needed
            RecordLoader::log("Error: " . $e->getMessage(), 500, "sdf56sd7f65");
            return false;
        }

        return false;
    }

    /**
     * Drop Table
     *
     * Deletes a database table from the database.
     *
     * @param string $tableName The name of the table to be deleted.
     *
     * @return bool True if the table is successfully deleted, false otherwise.
     */
    static function drop($tableName)
    {
        $connection = DatabaseHandler::connect();

        // Check if the table 'tableName' exists
        $query = "SHOW TABLES LIKE '{$tableName}'";
        $result = $connection->query($query);

        if ($result->rowCount() !== 0) :
            try {
                // Drop the table
                $sql = "DROP TABLE `{$tableName}`";
                $connection->exec($sql);
                RecordLoader::log("removed {$tableName} table", 200, "LI37CFqPg4J1SV");
            } catch (PDOException $e) {
                RecordLoader::log("Error {$tableName}: " . $e->getMessage(), 500, "A3S6RsvPboeFqo");
                return false;
            }
        endif;
        return true;
    }
}
