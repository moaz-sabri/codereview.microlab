<?php

namespace App\Utilities;

use App\Utilities\Filters;

use App\Utilities\Helper\Hashing;
use App\Utilities\Helper\TimeDate;

class Utilitie
{
    public $parameters;
    public $modules;

    use Hashing;
    use Validation;
    use Compressor;
    use TimeDate;
    use Filters;
    use Options;
    use Response;
    use Informations;

    #region [Filter friendly links]
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

    #region [Filter friendly links]
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
}
