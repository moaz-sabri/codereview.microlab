<article id="database-operations">
    <h2>Database Connection and CRUD Operations</h2>

    <h3>Step 1: Get Data</h3>

    <pre>
                            <code>
// Instantiate the PostModel
$blog = new PostModel();

// Simple query to get all data
$result = $blog->get();

// Single query with conditions
$blog->conditions = [["id", "=", 1]];
$result = $blog->find();

// Join query
$blog->merge = [
    [
        "key" => "file",
        "table" => "`storage` AS `file`",
        "type" => "INNER",
        "on" => "`file`.file_id = file.uid AND `blog`.project_id = {$id}",
        "columns" => "column"
    ]
];
$result = $blog->join();
$result = $blog->findJoin();

// Group query
$groupModel->merge = [
    [
        "key" => "owner",
        "table" => "`user` AS `users`",
        "type" => "LEFT",
        "on" => "users.group_id = group.uid",
        "columns" => "COUNT(DISTINCT users.group_id) AS user_count"
    ]
];
$result = $blog->group();
$result = $blog->findGroup();

// Options
$filestorage->count = 3; // count of rows
$filestorage->pagination = true; // is query pagination or one time
$filestorage->conditions = [["id", "=", 1]]; // where
                            </code>
                        </pre>

    <h3>Step 2: Save or Update Data</h3>

    <pre>
                            <code>
// Instantiate the PostModel
$post = new PostModel();

// Set column values
$post->column->group_id = $group->uid;
// ... other column assignments

// Save data
$post->save();

// To update, add conditions
$post->conditions = [["id", "=", 1]];
$post->column->group_id = $newGroupId; // Update values
// ... other column updates
$post->save();
                            </code>
                        </pre>

    <h3>Step 3: Delete Data</h3>

    <pre>
                            <code>
// Instantiate the PostModel
$post = new PostModel();

// Set conditions for deletion
$post->conditions = [["id", "=", 1]];

// Delete data
$post->delete();

// If you need to remove from the database, use destroy
$post->destroy();
                            </code>
                        </pre>

</article>