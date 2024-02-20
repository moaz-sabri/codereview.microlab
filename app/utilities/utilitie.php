<?php

namespace App\Utilities;

use App\Bootstrap\Response;
use App\Modules\Core\Model\PermissionModel;

use App\Modules\Core\Loader\{
    CryptLoader,
    PermissionLoader
};
use App\Utilities\Helper\{
    Hashing,
    TimeDate
};

class Utilitie
{
    use Hashing;
    use Validation;
    use TimeDate;
    use Informations;

    private static $activation = [
        "enable" => "ENABLE",
        "disabled" => "DISABLED"
    ];

    #region [Retrieves options based on the provided name.]
    /**
     *
     * This static method retrieves options stored in a class property based on the provided name.
     *
     * @param string $name The name of the property containing the options.
     *
     * @return object|null An object representing the options if found, or null if the property with the provided name does not exist.
     */
    public static function getOptions(string $name): ?object
    {
        if (isset(self::$$name)) {
            return (object) self::$$name;
        }
        return null;
    }
    #endregion


    #region [Output debugging information.]
    /**
     *
     * This function is used to output debugging information to aid in troubleshooting and development.
     *
     * @param mixed $data The data to be debugged.
     * @param bool $continue Optional. Determines whether to continue execution after debugging. Defaults to false.
     *
     * @return void
     */
    public function debug($data, $continue = false)
    {
        echo '<pre>';
        print_r($data);
        echo '</pre>';

        if (!$continue) exit;
    }
    #endregion

    #region [Check if a user has the specified permission.]
    /**
     *
     * @param string $permission The permission to check.
     * @param bool $continue Optional. Whether to continue checking other permissions if the specified one is not found. Defaults to false.
     * @param string $alternative Optional. Whether to alternative redirect link if the specified one is not found. Defaults to null.
     *
     * @return bool True if the user has the specified permission, false otherwise.
     */
    public static function isAllowed(string $permission,  bool $continue = false, string $alternative = null): bool
    {

        if (PERMISSION_OFF) return true;

        $module = null;
        $permissionsObject = PermissionLoader::getPermissions();
        foreach ($permissionsObject as $key => $property) :
            if (in_array($permission, $property)) :
                $module = $key;
                break;
            endif;
        endforeach;

        $group_id = CryptLoader::decrypt('group');

        $url = $group_id && is_null($alternative) ? '/403' : ($alternative ? $alternative : '/' . PATH_SIGN . 'signin/' . base64_encode(urlencode($_SERVER['REQUEST_URI'])));

        if (!is_null($module) && $group_id) :
            $permissionModel = new PermissionModel();
            $permissionModel->conditions = [
                ["permission_group_id", "=", $group_id],
                ["permission_module", "=", $module]
            ];

            $permissions = $permissionModel->find();
            if ($permissions) :
                if (in_array($permission, json_decode($permissions->permission_action))) return true;
            endif;

        else :
            $url = '/500';
        endif;

        if ($continue === true) return false;

        new Response($url, 301);
    }
    #endregion

    #region [ Checks if authentication is required and, if not authenticated, redirects to the sign-in page.]
    /**
     *
     * This function checks if authentication is required based on the provided parameters. If authentication is required and the user is not authenticated, it redirects to the sign-in page. If $continue is true, it returns null instead of redirecting.
     *
     * @param bool $continue Optional. If true, the function returns null instead of redirecting when authentication is required but the user is not authenticated. Defaults to false.
     *
     * @return void|null If $continue is false and authentication is required but the user is not authenticated, it redirects to the sign-in page. If $continue is true, it returns null instead of redirecting.
     */
    public function hasAuth(bool $continue = false, string $alternative = null): void
    {
        $uid = CryptLoader::decrypt('uid');

        if ($uid || $continue) return;

        $url = is_null($alternative) ?  '/' . PATH_SIGN . 'signin/' . base64_encode(urlencode($_SERVER['REQUEST_URI'])) : $alternative;

        new Response($url, 301);
    }
    #endregion

    #region [Generates a friendly URL based on the provided title and guide.]
    /**
     *
     * This function generates a friendly URL using the provided title and guide strings. The generated URL is typically human-readable and SEO-friendly.
     *
     * @param string $title The title string used in the URL.
     * @param string $guide The guide string used in the URL.
     *
     * @return string The generated friendly URL.
     */
    function friendly_url(string $title, string $guide): string
    {
        $idPart = $guide . '-';
        $urlFriendlyTitle = preg_replace('/[^a-zA-Z0-9]+/', '-', $title);

        if (strpos($urlFriendlyTitle, $idPart) !== false) {
            // Title already contains ID part, modify the remaining part
            $titleParts = explode($idPart, $urlFriendlyTitle, 2);
            $modifiedTitle = $titleParts[0] . $idPart . preg_replace('/[^a-zA-Z0-9]+/', '-', $titleParts[1]);
        } else {
            // Title does not contain ID part, add it
            $modifiedTitle = $idPart . $urlFriendlyTitle;
        }

        return $modifiedTitle;
    }
    #endregion

    #region [Extracts ID from a URL.] 
    /** 
     *
     * This function parses a URL and extracts the ID from it. It is typically used when dealing with URLs that contain identifiers.
     *
     * @param string $url The URL from which to extract the ID.
     *
     * @return string|null The extracted ID, or null if no ID is found.
     */
    function extractIdFromURL($url)
    {
        // Define the pattern to match the ID part
        $pattern = '/^([A-Z]-[A-Za-z0-9]{12})-/'; // Matches IDs like "G-b72664965f"

        // Use preg_match to find the ID using the pattern
        if (isset($url) && preg_match($pattern, $url, $matches)) {
            return $matches[1]; // The ID is captured in the first match
        }

        return null; // Return null if no ID is found
    }
    #endregion

    public static function isFileExist(string $path = null, string $type = null)
    {
        if (file_exists(STORAGE . "uploads/{$path}")) :
            return $path;
        else :
            if ($type == 'image') :
                return '/storage/uploads/images/placeholder.webp';
            else :
                return null;
            endif;
        endif;
    }
}
