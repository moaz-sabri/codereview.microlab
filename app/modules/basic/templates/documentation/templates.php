<article id="create-landing-page">
    <h2>Create a Landing Page</h2>

    <h3>Step 1: Update Module Route Configuration</h3>
    <p>In the 'setting.php' file inside the 'Basic' module directory, add the following route configuration:</p>

    <pre>
                            <code>
    namespace Joudev\Modules\Basic;

    class Setting
    {
        public static array $details = [
            // ... your module configuration details as provided
        ];

        public $route = [
            [
                "module" => "Basic",
                "function" => "dashboard",
                "url" => ""
            ],
            // ... other routes
        ];
    }
                            </code>
                        </pre>

    <h3>Step 2: Create Dashboard Function</h3>
    <p>In the 'controllers.php' file inside the 'Basic' module directory, add the following function:</p>

    <pre>
                            <code>
namespace Joudev\Modules\Basic;

class Controllers
{
    public function dashboard()
    {
        $page = "Dashboard"; // Set the page name

        // Your code for the dashboard function
        return (object) [
            "view" => "index", // the data
            "meta" => [
                "title" => $page . '-' . PROJECT_NAME // page title
            ],
        ];
    }

    // ... other functions
}
                            </code>
                        </pre>

    <h3>Step 3: Create View Layout</h3>
    <p>Create an 'index.php' file inside the 'templates' directory of the 'Basic' module to define the view layout:</p>

    <pre>
                            <code>
 // Inside 'Basic/templates/index.php'
 Simple Page

                            </code>
                        </pre>

    <p>This 'index.php' file will define the layout of your landing page. Customize it with the HTML content you want to display.</p>
</article>