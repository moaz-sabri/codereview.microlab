<?php

namespace App\Utilities;

trait Compressor
{

    function convertAndResizeToWebP($uploadedFilePath, $outputFilePath, $path, $maxWidth = 920)
    {
        // Validate input file
        if (!file_exists($uploadedFilePath)) {
            return false;
        }

        // Get the original image dimensions
        list($originalWidth, $originalHeight, $type) = getimagesize($uploadedFilePath);

        // Calculate the new height based on the aspect ratio and maximum width
        $newWidth = min($originalWidth, $maxWidth);
        $newHeight = ($newWidth / $originalWidth) * $originalHeight;

        // Perform image conversion and resizing using external tools
        $command = sprintf(
            "$path %s -resize %dx%d -quality 80 -define webp:lossless=false %s",
            escapeshellarg($uploadedFilePath),
            $newWidth,
            $newHeight,
            escapeshellarg($outputFilePath)
        );

        exec($command, $output, $resultCode);

        $output = shell_exec($command);
        echo $output; // Output for debugging


        // Check if the conversion was successful
        if ($resultCode === 0 && file_exists($outputFilePath)) {
            return true;
        }

        return false;
    }
}
