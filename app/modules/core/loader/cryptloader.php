<?php

namespace App\Modules\Core\Loader;

class CryptLoader
{
    // CryptLoader::encrypt($data)
    static function encrypt($data)
    {
        $serializedObject = serialize($data);
        $iv = openssl_random_pseudo_bytes(16); // Generate a 16-byte IV
        $encryptedData = openssl_encrypt($serializedObject, 'aes-256-cbc', SECRET_KEY, 0, $iv);
        $done = gzcompress($iv . $encryptedData);
        return LICENSE . base64_encode($done);
    }

    // CryptLoader::decrypt('token')
    static function decrypt($key)
    {
        if (isset($_SESSION[LICENSE])) :
            $start = base64_decode(str_replace(LICENSE, "", $_SESSION[LICENSE]));
            $data = gzuncompress($start);
            $iv = substr($data, 0, 16); // Extract the first 16 bytes as the IV
            $encryptedData = substr($data, 16);
            $serializedObject = openssl_decrypt($encryptedData, 'aes-256-cbc', SECRET_KEY, 0, $iv);
            $result = unserialize($serializedObject);

            if ($key === true) :
                return (object) $result;
            endif;

            return $result[$key];
        endif;
        return false;
    }
}
