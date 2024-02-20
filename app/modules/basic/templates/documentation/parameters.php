<article id="url-handling">
    <h2>URL Handling and Parameters</h2>

    <h3>Step 1: Parse URL</h3>

    <pre>
                            <code>
// Inside 'app/bootstrap/request.php'
function parseUrl()
{
    // ... existing code

    // Add parameters for module, endpoint, target, queries, and other
    $parameters = [
        'module' => $module,
        'endpoint' => $endpoint,
        'target' => $target,
        'queries' => $queries,
        'other' => $other,
    ];

    return $parameters;
}
                            </code>
                        </pre>

    <h3>Step 2: URL Structure Examples</h3>

    <p>For language settings:</p>

    <pre>
                           <code>
// URL: domain/en/your-module/your-function/your-target?param1=value1&param2=value2 
$parameters = parseUrl();
$language = $parameters['module']; // 'en'
$module = $parameters['endpoint']; // 'your-module'
$function = $parameters['target']; // 'your-function'
$queries = $parameters['queries']; // ['param1' => 'value1', 'param2' => 'value2']
                            </code>
                        </pre>

    <p>For API requests:</p>

    <pre>
        <code>
// URL: domain/api/your-request?param1=value1&param2=value2 
$parameters = parseUrl();
$isApi = ($parameters['module'] === 'api'); // true
$apiRequest = $parameters['endpoint']; // 'your-request'
$queries = $parameters['queries']; // ['param1' => 'value1', 'param2' => 'value2']
                        </code>
                    </pre>

</article>