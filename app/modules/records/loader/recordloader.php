<?php

namespace App\Modules\Records\Loader;

use App\Database\DatabaseHandler;
use App\Modules\Permissions\Loader\CryptLoader;
use App\Utilities\Utilitie;
use Exception;

class RecordLoader extends Utilitie
{

    /**
     * Set and save a log entry.
     *
     * @param array $log An array containing log information.
     *
     * @return object An instance of the RecordModel representing the saved log entry.
     */
    public static function log(string $message = "Custom error message", int $code = 404, string $hash = null)
    {

        if ($code === 200) :
            $status = "success";
        else :
            $status = "fails";
        endif;
        // Prepare log data
        $data = [
            "guide" => self::guide("L"),
            "owner" => CryptLoader::decrypt('uid') ?? null,
            "type" => 'log',
            "status" => $status,
            "hash" =>  $hash,
            "code" => $code,
        ];

        // Convert and store the log message as JSON
        if (is_array($message)) :
            $data['message'] = json_encode($message);
        else :
            $data['message'] = $message;
        endif;

        // Log the error
        self::locallog($data);
        self::save($data);
        return;
    }

    /**
     * Set and save a log entry.
     *
     * @param array $log An array containing log information.
     *
     * @return object An instance of the RecordModel representing the saved log entry.
     */
    public static function history(string $message = "Custom error message", int $res = 0)
    {
        if ($res === 1) :
            $status = "success";
        else :
            $status = "fails";
        endif;

        // Prepare log data
        $data = [
            "guide" => self::guide("G"),
            "owner" => CryptLoader::decrypt('uid') ?? null,
            "type" => 'history',
            "status" => $status,
            "message" =>  $message,
        ];

        self::save($data);
        return;
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

                if (!$response) {
                    self::locallog("Query execution failed: " . json_encode($stmt));
                }
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
    static function locallog(string|array $message)
    {
        // Create a log entry with a timestamp and the provided message or data
        $logEntry = [
            'timestamp' => date('Y-m-d H:i:s'),
            'message' => $message,
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

        return;
    }
}
