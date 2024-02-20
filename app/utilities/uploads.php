<?php

namespace App\Utilities;

use App\Extends\Record\RecordLoader;

class Uploads extends Utilitie
{

    // File validation
    public $file;
    public $index = 0;
    public $location;
    public $allowedTypes = ['image/jpeg', 'image/png', 'image/gif', 'application/pdf', 'image/svg+xml', 'application/msword', 'application/vnd.ms-excel', 'image/webp']; // Allowed file types
    public $maxSize = 5 * 1024 * 1024; // Maximum file size in bytes (5MB)
    public  $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'svg', 'doc', 'xlsx', 'webp'];

    function upload()
    {
        if ($this->file['size'][$this->index] > $this->maxSize) {
            RecordLoader::log('File size exceeds the maximum limit of 5MB', 500, "sd675fa87sd6f5");
        }

        if (!in_array($this->file['type'][$this->index], $this->allowedTypes)) {
            RecordLoader::log('Invalid file type. Only JPG, PNG, GIF, PDF, SVG, DOC, XLSX, and WEBP files are allowed.', 500, "sd675fa87sd6f5");
        }

        $fileName = strtolower($this->file['name'][$this->index]);
        $fileExtension = pathinfo($fileName, PATHINFO_EXTENSION);

        if (!in_array($fileExtension, $this->allowedExtensions)) {
            RecordLoader::log('Invalid file name or extension. Please use JPG, PNG, or GIF files.', 500, "sd675fa87sd6f5");
        }

        // Generate a unique filename to prevent overwriting
        $name = uniqid('file_') . '.' . $fileExtension;

        $destination = "../storage/{$this->location}";
        if (!is_dir($destination)) :
            mkdir($destination, 0777, true);
        endif;

        // Move the uploaded file to the destination
        if (move_uploaded_file($this->file['tmp_name'][$this->index], $destination . $name)) :
            RecordLoader::activity("New image uploaded successfully.", 1);

            $uploaded = DS . $this->location . $name;

            return (object) [
                "name" =>  filter_var($fileName, FILTER_SANITIZE_URL),
                "file" => $uploaded,
                "size" => $this->file['size'][$this->index],
                "extension" => $fileExtension
            ];
        endif;

        RecordLoader::log("Failed to upload the file. Please try again.", 500, "WE8x1rSBUCnqh2");
        return false;
    }
}
