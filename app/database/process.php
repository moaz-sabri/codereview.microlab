<?php

namespace App\Database;

use App\Bootstrap\Request;
use App\Modules\Records\Loader\RecordLoader;
use App\Utilities\Utilitie;
use PDO;
use PDOException;

class DatabaseHandler
{

    /**
     * Retry Attempts
     *
     * The maximum number of retry attempts when establishing a database connection.
     *
     * @var int
     */
    private static $retryAttempts = 3;

    /**
     * Retry Delay (Seconds)
     *
     * The delay in seconds between retry attempts when establishing a database connection.
     *
     * @var int
     */
    private static $retryDelaySeconds = 5;

    /**
     * Connect to Database
     *
     * Establishes a connection to the MySQL database using PDO.
     * 
     * @return PDO|null The PDO (PHP Data Objects) connection if successful, null otherwise.
     */
    public static function connect(): PDO|null
    {
        // Retry logic in case of connection failure
        for ($attempt = 1; $attempt <= self::$retryAttempts; $attempt++) :
            try {
                // Attempt to establish a connection
                return new PDO('mysql:host=mysql;dbname=' . DB_NAME, DB_USER, DB_PASS);

                // If successful, break out of the loop
                break;
            } catch (PDOException $e) {
                // Handle connection error
                if ($attempt < self::$retryAttempts) :
                    // Wait for the specified delay before the next attempt
                    sleep(self::$retryDelaySeconds);
                else :
                    RecordLoader::locallog('Failed to connect to the database: ' . $e->getMessage(), 500, "s7fsd7f");
                endif;
            }
        endfor;

        return null;
    }
}

trait Process
{

    /**
     * Process Query Type
     *
     * Determines the type of the query (normal, join, group).
     *
     * @param string $query The SQL query.
     *
     * @return string The query type.
     */
    private function process(string $type = '')
    {
        $getCols = "";
        // Get the properties of the object
        $objectProperties = get_object_vars($this->column);

        switch ($type):
            case 'join':
            case 'group':

                foreach (array_keys($objectProperties) as $key) :
                    $table = $this->tableName;
                    $getCols .= "`{$table}`.`{$key}` AS `{$table}_{$key}`,";
                endforeach;

                foreach ($this->merge as $table) {
                    if (is_object($table['columns'])) :
                        foreach ($table['columns'] as $column => $t) :
                            if (is_numeric($column)) :
                                $getCols .= "`{$table['key']}`.`{$t}` AS `{$table['key']}_{$t}`,";
                            else :
                                $getCols .= "`{$table['key']}`.`{$column}` AS `{$table['key']}_{$column}`,";
                            endif;
                        endforeach;
                    else :
                        $getCols .= $table['columns'] . " ,";
                    endif;
                }
                break;

            default:
                if (isset($this->except) && count($this->except) > 0) :
                    foreach ($this->except as $key => $value) :
                        unset($this->column->$value);
                    endforeach;
                endif;

                foreach (array_keys($objectProperties) as $key) :
                    $getCols .= "`{$this->tableName}`.`{$key}`,";
                endforeach;
                break;
        endswitch;


        return substr($getCols, 0, -1); // or rtrim($getCols, ", ");
    }

    /**
     * Pagination
     *
     * Adds pagination conditions to the SQL query.
     *
     * @param string $query The SQL query.
     *
     */
    private function pagination()
    {
        $request = new Request;

        if (isset($request->parameters->queries->current)) {
            $this->current = filter_var($request->parameters->queries->current, FILTER_VALIDATE_INT, ['options' => ['min_range' => 0, 'max_range' => 99]]) ?? $this->current;
        }

        if (isset($request->parameters->queries->count)) {
            $this->count = filter_var($request->parameters->queries->count, FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 99]]) ?? $this->count;
        }

        // Calculate the starting row for pagination
        $this->startRow = ($this->current - 1) * $this->count;
    }

    /**
     * Get Conditions
     *
     * Retrieves the conditions for the SQL query.
     *
     */
    private function getConditions()
    {
        $conditions = " WHERE ";

        foreach ($this->conditions as $key => $value) :
            $first_con = '';
            $column = '';
            $sec_con = '';
            $data = '';

            if ($key === 0) :
                $column = "`{$this->tableName}`.`$value[0]`";

                if (in_array($value[1], ['IS NULL', 'IS NOT NULL'])) :
                    //         0          1
                    // Ex.`created_at` IS NULL
                    $sec_con = $value[1];

                elseif (in_array($value[1], ['BETWEEN', 'NOT BETWEEN'])) :
                    //         0          1           2                    3
                    // Ex. `created_at` BETWEEN '2023-09-01 04:13' ? '2023-09-30 04:13'
                    $sec_con = $value[1];
                    $data = ":{$key}_{$value[0]} AND :to_{$key}_{$value[0]}";

                elseif (in_array($value[1], ['IN', 'NOT IN'])) :
                    //       0    1     2
                    // Ex. `uid` IN (6,7,8,9)
                    $sec_con = $value[1];

                    $vals = [];
                    foreach ($value[2] as $n => $i) :
                        $x = "in_" . $n;
                        $vals[] = ":{$x}_{$value[0]}";
                    endforeach;
                    $data = "(" . implode(", ", $vals) . ")";

                else :
                    //          0       1         2
                    // Ex. `created_at` ? '2023-09-30 04:13'
                    $sec_con = $value[1];
                    $data = ":{$key}_{$value[0]}";

                endif;

            else :
                if (!isset($value[3])) array_unshift($value, "AND");

                $first_con = $value[0];
                $column = "`{$this->tableName}` . `$value[1]`";

                if (in_array($value[2], ['IS NULL', 'IS NOT NULL'])) :
                    //     0      1          2
                    // Ex. ? `created_at` IS NULL
                    $sec_con = $value[2];

                elseif (in_array($value[2], ['BETWEEN', 'NOT BETWEEN'])) :
                    //     0       1         2            3                  4
                    // Ex. ? `created_at` BETWEEN '2023-09-01 04:13' ? '2023-09-30 04:13'
                    $sec_con = $value[2];
                    $data = ":{$key}_{$value[1]} AND :to_{$key}_{$value[1]}";

                elseif (in_array($value[2], ['IN', 'NOT IN'])) :
                    //     0   1   2       3
                    // Ex. ? `uid` IN (6,7,8,9)
                    $sec_con = $value[2];

                    $vals = [];
                    foreach ($value[3] as $n => $i) :
                        $x = "in_" . $n;
                        $vals[] = ":{$x}_{$value[1]}";
                    endforeach;
                    $data = "(" . implode(", ", $vals) . ")";

                else :
                    //      0      1      2        3
                    // Ex. ? `created_at` ? '2023-09-30 04:13'
                    $sec_con = $value[2];
                    $data = ":{$key}_{$value[1]}";

                endif;
            endif;

            $conditions .= " {$first_con} {$column} {$sec_con} {$data} ";
        endforeach;

        return $conditions;
    }

    /**
     * Set Conditions
     *
     * Sets conditions for the SQL query.
     *
     * @param array $conditions The conditions for the query.
     *
     * @return mixed The modified query with conditions.
     */
    private function setConditions($stmt): mixed
    {
        $values = [];

        foreach ($this->conditions as $key => $value) :
            if ($key === 0) :
                if (in_array($value[1], ['IS NULL', 'IS NOT NULL'])) :
                // emtpy 

                elseif (in_array($value[1], ['BETWEEN', 'NOT BETWEEN'])) :
                    //         0          1           2                    3
                    // Ex. `created_at` BETWEEN '2023-09-01 04:13' ? '2023-09-30 04:13'
                    $values[] = [":{$key}_{$value[0]}", $value[2]];
                    $values[] = [":to_{$key}_{$value[0]}", $value[3]];

                elseif (in_array($value[1], ['IN', 'NOT IN'])) :
                    //       0   1      2
                    // Ex. `uid` IN (6,7,8,9)

                    foreach ($value[2] as $n => $i) :
                        $x = "in_" . $n;
                        $values[] = [":{$x}_{$value[0]}", $i];
                    endforeach;

                else :
                    //          0       1         2
                    // Ex. `created_at` ? '2023-09-30 04:13'
                    $values[] = [":{$key}_{$value[0]}", $value[2]];
                endif;

            else :
                if (!isset($value[3])) array_unshift($value, "AND");

                if (in_array($value[2], ['IS NULL', 'IS NOT NULL'])) :
                //  Emtpy

                elseif (in_array($value[2], ['BETWEEN', 'NOT BETWEEN'])) :
                    //     0       1         2            3                  4
                    // Ex. ? `created_at` BETWEEN '2023-09-01 04:13' ? '2023-09-30 04:13'
                    $values[] = [":{$key}_{$value[1]}", $value[3]];
                    $values[] = [":to_{$key}_{$value[1]}", $value[4]];


                elseif (in_array($value[2], ['IN', 'NOT IN'])) :
                    //     0   1   2       3
                    // Ex. ? `uid` IN (6,7,8,9)
                    foreach ($value[3] as $n => $i) :
                        $x = "in_" . $n;
                        $values[] = [":{$x}_{$value[1]}", $i];

                    endforeach;

                else :
                    //      0      1      2        3
                    // Ex. ? `created_at` ? '2023-09-30 04:13'
                    $values[] = [":{$key}_{$value[1]}", $value[3]];

                endif;
            endif;

        endforeach;

        foreach ($values as $key => $value) :
            $stmt->bindValue($value[0], $value[1]);
        endforeach;

        return $stmt;
    }

    /**
     * Is Deep Query
     *
     * Checks if the query involves a deleted_at column (soft delete).
     *
     * @return string True if the query involves a deleted_at column, false otherwise.
     */
    private function isDeep($sql): string
    {
        // Get the properties of the object
        $objectProperties = get_object_vars($this->column);

        if (!$this->deep && key_exists('deleted_at', $objectProperties)) :

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $sql .= " AND `{$this->tableName}`.`deleted_at` IS NULL ";
            else :
                $sql .= " WHERE `{$this->tableName}`.`deleted_at` IS NULL ";
            endif;
        endif;

        return $sql;
    }

    /**
     * Format Query
     *
     * Adds order and limit conditions to the SQL query.
     *
     * @param string $query The SQL query.
     *
     * @return string The modified query with order and limit.
     */
    private function format($sql): string
    {
        // Add ORDER BY and LIMIT clauses for pagination
        if (is_array($this->sort)) :
            $sorts = "";
            foreach ($this->sort as $key => $sort) {
                $sorts .= " `{$this->tableName}`.`{$sort['by']}` {$sort['order']}, ";
            }
            $sorts = rtrim($sorts, ", ");
            $sql .= " ORDER BY {$sorts} ";

        else :

            // Get the properties of the object
            $objectProperties = get_object_vars($this->column);

            if (!key_exists($this->sort, $objectProperties)) $this->sort = $this->primaryKey;

            $sql .= " ORDER BY `{$this->tableName}`.`{$this->sort}` {$this->direction} ";
        endif;

        $sql .= " LIMIT {$this->startRow}, {$this->count}";

        return $sql;
    }

    /**
     * Generate Query
     *
     * Generates the final SQL query based on conditions and type.
     *
     * @param string $type The type of query (normal, join, group).
     *
     * @return string The final SQL query.
     */
    private function generateQuery($type = ''): string
    {
        $cols = $this->process($type);

        if ($this->pagination) :
            $this->pagination();
        endif;

        return "SELECT {$cols} FROM `{$this->tableName}`";
    }

    /**
     * Generate Join
     *
     * Generates the JOIN part of the SQL query.
     *
     * @return string The JOIN part of the SQL query.
     */
    private function generateJoin(): string
    {
        $j = "";
        foreach ($this->merge as $join) :
            if (isset($join['table'])) :
                $j .= " {$join['type']} JOIN {$join['table']} ON  {$join['on']} ";
            endif;
        endforeach;

        return $j;
    }

    /**
     * Query
     *
     * Generates a normal SQL query.
     * 
     * @param string $sql The query.
     * @param bool $afterwhere The option after where.
    
     *
     * @return mixed The SQL query.
     */
    private function query(string $sql, $afterwhere = false)
    {

        $db = DatabaseHandler::connect();

        if (isset($this->conditions) && count($this->conditions) > 0) :
            $this->conditionsString = $this->getConditions();
            $sql .= $this->conditionsString;
        endif;

        $sql = $this->isDeep($sql);

        if ($afterwhere) :
            $sql .= $afterwhere;
        endif;

        $sql = $this->format($sql);
        $this->sqlQuery = $sql;

        try {

            $stmt = $db->prepare($sql);
            if (!$stmt) :
                RecordLoader::log("Query preparation failed: " . json_encode($stmt), 500, "1t1UsFdsmUTvos");
                return false;
            endif;

            if (isset($this->conditions) && count($this->conditions) > 0) :
                $stmt = $this->setConditions($stmt);
            endif;

            if ($stmt->execute() && $stmt->rowCount() > 0) :
                return $stmt;
            else :
                return false;
            endif;
        } catch (PDOException $e) {
            RecordLoader::log("Error: " . $e->getMessage(), 500, "x3TOpGyxVbrd3A");
        }
        return false;
    }

    /**
     * Get Count
     *
     * Retrieves the count of rows from the table.
     *
     * @return int The count of rows.
     */
    private function getCount(): int
    {
        // Construct the base SQL query
        $sql = "SELECT COUNT(*) AS total FROM `{$this->tableName}`";

        if (isset($this->conditionsString)) $sql .= $this->conditionsString;

        $sql = $this->isDeep($sql);

        $db = DatabaseHandler::connect();
        $stmt = $db->prepare($sql);


        if (isset($this->conditions) && count($this->conditions) > 0) :
            $stmt = $this->setConditions($stmt);
        endif;

        if ($stmt->execute() && $stmt->rowCount() > 0) :
            $response = $stmt->fetchAll(PDO::FETCH_ASSOC)[0]['total'];
            return $response;
        else :
            return 0;
        endif;
    }

    /**
     * Get Analysis
     *
     * Retrieves counts data via related tables.
     *
     * @return object|bool Counts data.
     */
    private function getList(): object|bool
    {
        $db = DatabaseHandler::connect();

        // Construct the base SQL query
        $list = implode(',', $this->list);
        $sql = "SELECT {$list}, COUNT(*) AS total FROM `{$this->tableName}`";

        if (isset($this->conditions) && count($this->conditions) > 0) :
            $this->conditionsString = $this->getConditions();
            $sql .= $this->conditionsString;
        endif;

        $sql = $this->isDeep($sql);

        $sql .= " GROUP BY {$this->list[0]} ORDER BY total DESC LIMIT {$this->count};";

        $stmt = $db->prepare($sql);
        $this->sqlQuery = $sql;

        if (isset($this->conditions) && count($this->conditions) > 0) :
            $stmt = $this->setConditions($stmt);
        endif;

        if ($stmt->execute() && $stmt->rowCount() > 0) :
            $response = (object) $stmt->fetchAll(PDO::FETCH_OBJ);
            return $response;
        else :
            return false;
        endif;
    }

    /**
     * Get Response
     *
     * Checks if the query returns pagination or just an object.
     *
     * @return object The response based on the query type.
     */
    private function getResponse(array $response): object
    {
        if ($this->pagination) :
            $total = $this->getCount();
            $pages = count($response) <= $this->count && $this->current == 0 ? count($response) : $this->startRow + count($response);
            $url = explode('?', DS . trim($_SERVER['REQUEST_URI'], '/'));

            return (object) [
                "result" => $response,
                "current" => $this->current,
                "count" => $this->count,
                "total" => $total ?? 0,
                "pages" => $pages,
                "url" => $url[0],
            ];
        else :
            return (object) $response;
        endif;
    }
}
