<?php

namespace App\Extends\Record;

use App\Database\DatabaseHandler;
use App\Modules\Core\Loader\CryptLoader;
use App\Utilities\Utilitie;
use Exception;

class RecordLoader extends Utilitie
{
    private static $statusCode;
    private static $message;
    private static $hash;
    private static $type;

    /**
     * Set and save a log entry.
     *
     * @param array $log An array containing log information.
     *
     * @return object An instance of the RecordModel representing the saved log entry.
     */
    public static function log(string $message = "Custom error message", int $code = 404, string $hash = null)
    {
        self::$statusCode = $code;
        self::$message = $message;
        self::$hash = $hash;
        self::$type = 'logs';

        $_SESSION['FLAG'] = true;

        if (isset($_SESSION['FLAG'])) :
            $data = self::funname();
        else :
            $data = [
                "owner" => CryptLoader::decrypt('uid') ?? -1,
                "type" => 'logs',
                "status" => 'fails',
                "hash" =>  $hash,
                "code" => $code,
            ];
        endif;

        // Log the error
        self::locallog($data);
    }

    /**
     * Set and save a log entry.
     *
     * @param array $log An array containing log information.
     *
     * @return object An instance of the RecordModel representing the saved log entry.
     */
    public static function activity(string $message = "Custom error message", int $code = 0)
    {
        self::$statusCode = $code == 1 ? 200 : 500;
        self::$message = $message;
        self::$hash = '';
        self::$type = 'activity';

        $_SESSION['FLAG'] = true;

        if (isset($_SESSION['FLAG'])) :
            self::funname();
        endif;
    }

    private static function funname()
    {
        if (self::$statusCode === 200) :
            $status = "success";
        else :
            $status = "fails";
        endif;

        // Prepare log data
        $data = [
            "record_guide" => self::guide("L"),
            "record_owner" => CryptLoader::decrypt('uid') ?? -1,
            "record_type" => self::$type,
            "record_status" => $status,
            "record_hash" =>  self::$hash,
            "record_code" => self::$statusCode,
        ];

        // Convert and store the log message as JSON
        if (is_array(self::$message)) :
            $data['record_message'] = json_encode(self::$message);
        else :
            $data['record_message'] = self::$message;
        endif;

        if (self::save($data)) :
            unset($_SESSION['FLAG']);
        endif;

        return $data;
    }

    private static function save($data)
    {
        $sql = "INSERT INTO records (" . implode(', ', array_keys($data)) . ") VALUES (:" . implode(', :', array_keys($data)) . ")";

        // Assuming you have a valid database connection
        $connection = DatabaseHandler::connect();

        if (!is_null($connection)) :
            try {

                $stmt = $connection->prepare(strip_tags($sql));
                if (!$stmt) {
                    self::locallog("Query preparation failed: " . json_encode($connection));
                }

                // Prepare and execute the SQL statement
                $response = $stmt->execute($data);

                if ($response) :
                    return true;
                else :
                    self::locallog("Query execution failed: " . json_encode($stmt));
                endif;
            } catch (Exception $e) {
                // Log the error and return false
                self::locallog("Query execution failed: " . $e->getMessage());
            }
        endif;

        return false;
    }

    /**
     * Log an error message to the error log file.
     *
     * @param string|array $message The error message or data to be logged.
     *
     * @return void
     */
    static function locallog(string|array $data)
    {
        // Create a log entry with a timestamp and the provided data or data
        $logEntry = [
            'timestamp' => date('Y-m-d H:i:s'),
            'data' => $data,
        ];

        // Define the path to the error log file
        $logFilePath = STORAGE . 'logs/logs.json';

        $logEntries = [];

        // Check if the error log file exists
        if (file_exists($logFilePath)) {
            // Read the current log content and decode it as JSON
            $logContent = file_get_contents($logFilePath);
            $logEntries = json_decode($logContent, true);

            // Ensure $logEntries is an array, or initialize it as an empty array
            if (!is_array($logEntries)) {
                $logEntries = [];
            }
        }

        // Add the new log entry to the existing log entries
        $logEntries[] = $logEntry;

        // Write the updated log entries back to the error log file as JSON
        file_put_contents($logFilePath, json_encode($logEntries, JSON_PRETTY_PRINT));
    }
}
