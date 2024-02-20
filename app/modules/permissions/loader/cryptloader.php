<?php

namespace App\Modules\Permissions\Loader;

class CryptLoader
{

    // CryptLoader::encrypt($data)
    static function encrypt($data)
    {
        $serializedObject = serialize($data);
        $iv = openssl_random_pseudo_bytes(16); // Generate a 16-byte IV
        $encryptedData = openssl_encrypt($serializedObject, 'aes-256-cbc', SECRET_KEY, 0, $iv);
        $done = gzcompress($iv . $encryptedData);
        return base64_encode($done);
    }

    // CryptLoader::decrypt('token')
    static function decrypt($key)
    {
        if (isset($_SESSION[SESSION])) :
            $start = base64_decode($_SESSION[SESSION]);
            $data = gzuncompress($start);
            $iv = substr($data, 0, 16); // Extract the first 16 bytes as the IV
            $encryptedData = substr($data, 16);
            $serializedObject = openssl_decrypt($encryptedData, 'aes-256-cbc', SECRET_KEY, 0, $iv);
            $result = unserialize($serializedObject);

            if ($key === true) :
                return $result;
            endif;

            return $result[$key];
        endif;
        return false;
    }
}
