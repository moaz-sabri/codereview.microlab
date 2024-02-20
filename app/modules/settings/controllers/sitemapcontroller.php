<?php

namespace App\Modules\Settings\Controllers;

use App\Bootstrap\Request;
use App\Modules\Basic\Setting as Settings;
use App\Utilities\helper\Hashing;
use App\Utilities\Utilitie;

class SitemapController extends Utilitie
{
    use Hashing;

    public $sitemapFile = ROOT . 'sitemap.xml';


    function dashboard()
    {

        if (!Settings::permission('dashboard')) :
            $this->notAllowd();
        endif;

        return (object) [
            "obj" => $this->preview(),
            "view" => "sitemap",
            "meta" => [
                "title" => PROJECT_NAME
            ]
        ];
    }


    // Array of your website's URLs
    public $urls = array(
        "http://example.com/",
        "http://example.com/page1",
        "http://example.com/page2",
        "http://example.com/page2",
        "http://example.com/page2",
        "http://example.com/page2",
        "http://example.com/page2",
        // Add more URLs here
    );

    function generate()
    {

        if (!Settings::permission('create')) :
            $this->notAllowd();
        endif;

        // Create the sitemap XML content
        $xml = '<?xml version="1.0" encoding="UTF-8"?>' . PHP_EOL;
        $xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . PHP_EOL;
        foreach ($this->urls as $url) :
            $xml .= "<url id='{$this->GENERATE_6_LETTERS()}'>" . PHP_EOL;
            $xml .= '<loc>' . htmlspecialchars($url) . '</loc>' . PHP_EOL;
            $xml .= '</url>' . PHP_EOL;
        endforeach;
        $xml .= '</urlset>';

        // Write the XML content to a file
        file_put_contents(ROOT . 'sitemap.xml', $xml);

        return "Sitemap generated successfully!" . PHP_EOL;
    }

    function add(string $newUrl)
    {

        if (!Settings::permission('create')) :
            $this->notAllowd();
        endif;

        // Load the existing sitemap.xml file

        $xml = simplexml_load_file($this->sitemapFile);

        // Create a new <url> element
        $urlElement = $xml->addChild('url');
        $urlElement->addAttribute('id', $this->GENERATE_6_LETTERS());


        // Add the <loc> element to the <url> element
        $urlElement->addChild('loc', $newUrl);

        // Save the modified XML back to the sitemap.xml file
        $xml->asXML($this->sitemapFile);

        return "URL added to sitemap: $newUrl";
    }

    function remove($cardid)
    {

        if (!Settings::permission('delete')) :
            $this->notAllowd();
        endif;

        $xml = simplexml_load_file($this->sitemapFile);
        $urls = $xml->xpath("//url[@id='fbdef907']");

        if (empty($urls)) return false;

        $dom = dom_import_simplexml($urls[0]);
        $dom->parentNode->removeChild($dom);

        $xml->asXML($this->sitemapFile);

        return true;
    }

    function preview(int $current = 1, int $count = 30)
    {
        if (!Settings::permission('preview')) :
            $this->notAllowd();
        endif;

        // Load the XML file from a URL
        $xml = simplexml_load_file($this->sitemapFile);

        $request = new Request;
        // Validate and set the current page number and count from GET parameters
        if (isset($request->parameters->queries->current)) {
            $current = filter_var($request->parameters->queries->current, FILTER_VALIDATE_INT, ['options' => ['min_range' => 0, 'max_range' => 99]]) ?? $current;
        }

        if (isset($request->parameters->queries->count)) {
            $count = filter_var($request->parameters->queries->count, FILTER_VALIDATE_INT, ['options' => ['min_range' => 1, 'max_range' => 99]]) ?? $count;
        }

        $totalRows = count($xml->url); // Total number of rows in the XML

        // Calculate the starting and ending indices for the current page
        $startIndex = ($current - 1) * $count;
        $endIndex = min($startIndex + $count, $totalRows);

        $urls = [];
        // Loop through the rows for the current page
        for ($i = $startIndex; $i < $endIndex; $i++) {
            $urls[] = [
                "id" => (string) $xml->url[$i]['id'],
                "url" => (string) $xml->url[$i]->loc,
            ]; // Get the 'loc' element for the current row
        }

        // Create pagination links
        $totalPages = ceil($totalRows / $count);

        $backUrl = isset($_SESSION['history'][1]) && ($backUrl = strstr($_SESSION['history'][1], '?', true)) ? $backUrl : $_SESSION['history'][1] ?? $_SESSION['history'][0];

        // Create and return an object with result data
        return (object) [
            "obj" => $urls,
            "current" => $current,
            "count" => $count,
            "total" => $totalRows,
            "pages" => $totalPages,
            "url" => $backUrl,
        ];
    }
}
