<article id="create-new-module">
    <h2>How to Create a New Module</h2>

    <h3>Step 1: Create Module Files</h3>
    <p>Navigate to the modules directory in your Joudev light-framework and follow these steps:</p>

    <pre>
        <code>
// Inside the 'blog' directory, create a file named 'controllers/postcontroller.php'.
namespace Joudev\Modules\Blog\Controllers;

class PostController
{
    // ... your controller methods
}
        </code>
    </pre>

    <pre>
        <code>
// Inside the 'blog' directory, create a file named 'loaders/loader.php'.
namespace Joudev\Modules\Blog\loaders;

class Loader
{
    // ... your loader methods
}
        </code>
    </pre>

    <h3>Step 2: Create Templates</h3>
    <p>Create a templates directory inside the 'blog' directory and add view pages for your module. Example view file: templates/explorePosts.php</p>

    <h3>Step 3: Configure Module</h3>
    <p>Create a 'setting.php' file inside the 'blog' directory to configure your module:</p>

    <pre>
        <code>
// Inside the 'blog' directory, create a file named 'setting.php'.
namespace Joudev\Modules\Blog;

class Setting
{
    public static array $details = [
        // ... your module configuration details as provided
    ];

    public $route = [
        // ... your module route configuration as provided
    ];
}
        </code>
    </pre>

    <h3>Step 4: Create Model</h3>
    <p>Inside the 'blog' directory, create a file named 'postmodel.php' for the post model:</p>

    <pre>
        <code>
namespace Joudev\Modules\Blog\Models;

class PostModel
{
    private static string $moduleName = 'blog'; // table name
    private static array $cols = [
        "owner" => "INT(11) NOT NULL", 
        // ... your columns
    ];

    public string $pattern = '/^F-[A-Za-z0-9]{12}$/'; // guide format
}
        </code>
    </pre>

    <h3>Step 5: Access the Module</h3>
    <p>Now, your "blog" module will be accessible in the dashboard. Users with the necessary permissions can explore posts using the configured routes.</p>
</article>