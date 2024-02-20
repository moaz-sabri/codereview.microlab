Creating documentation for a new service in your PHP light-framework project is a crucial step in helping developers understand how to extend and use your light-framework effectively. Let's break down the process of creating documentation for adding a new service to your project.

## Creating Documentation for Adding a New Service to Your PHP light-framework

### Introduction

Begin your documentation by introducing the purpose of this document: creating a new service within your PHP light-framework. Explain that services are modules that provide specific functionality to your application and describe their role in enhancing the project's capabilities.

### Prerequisites

List any prerequisites developers should have before attempting to create a new service. This may include knowledge of PHP, the project structure, and familiarity with the existing services.

### Step 1: Create a New Service Folder

1.1. In the `modules` directory, create a new folder with a plural name that represents the new service. For example, if you're creating a "Blog" service, name the folder "blogs."

### Step 2: Create a Service Singleton Class

2.1. Inside the service folder, create a PHP class that acts as a singleton for the service. Name the class in singular form with an appropriate name for your service. For instance, if your service is for blogs, the class name might be `BlogService`.

2.2. Implement the necessary methods and properties in the service class that will encapsulate the functionality of the new service. This may include methods for CRUD operations, data retrieval, and any specific features related to the service.

2.3. Ensure that the service class extends the core light-framework class or interfaces as needed for consistency.

### Step 3: Create a Service Model Class

3.1. In the same service folder, create a model class that handles database interactions for the service. Name the model class appropriately, such as `BlogModel`.

3.2. The model class should extend the base model class for database connectivity. Implement methods for interacting with the database, such as fetching, updating, or deleting record related to the service.

3.3. Define the database table structure and relationships specific to the service in the model class.

### Step 4: Create Service Routes

4.1. In the `router` directory, create a new route file for the service, if it doesn't already exist. Name the route file accordingly, e.g., `blogs.php`.

4.2. Define the routes for the new service in the route file. Specify the URL patterns, HTTP methods, and corresponding controller actions or service methods.

### Step 5: Create Templates

5.1. In the `templates` directory, create a folder for your service's templates if one doesn't exist. Name the folder appropriately, such as `blogs`.

5.2. Within the service's template folder, create template files for different views or pages related to the service. These templates will define the UI for your service.

### Step 6: Add Service to the Router

6.1. In the core router configuration, add a route for your new service, pointing to the appropriate controller or service methods.

### Conclusion

Summarize the steps taken to create a new service within the light-framework, emphasizing the importance of adhering to the project's structure and conventions.

### Additional Tips

- Explain any conventions or best practices that developers should follow when creating a new service, such as naming conventions, folder structure, and code organization.
- Provide code examples and usage scenarios to illustrate how to interact with the new service.
- Offer troubleshooting tips or common pitfalls developers might encounter during the process.

By following this documentation, developers will be equipped to create and integrate new services into your PHP light-framework effectively, taking advantage of the core features like OOP, Bootstrap integration, SVG icons, Quill editing, and MySQL connectivity.

To help you better understand how to use the code structure you've outlined, I'll provide a simplified example of creating a "posts" service within your PHP light-framework, including the steps you've described. Please note that this example assumes you have the light-framework structure and core classes set up.

### Step 1: Create Folder and Classes

1.1. Create a folder for the "posts" service within the `modules` directory.

1.2. Create the following classes:

- `PostService` (Main service class)
- `PostRequests` (Request handling class)
- `PostModel` (Database model class)
- `PostURLs` (URL routing class)

### Step 2: Module Class (PostService)

```php
class PostService {
    private $module;

    public function __construct($module) {
        $this->module = $module;
    }

    public function dashboard() {
        // Function to handle dashboard logic
    }

    public function main() {
        // Function to handle main client-side logic
    }

    public function store() {
        // Function to create a new post
    }

    public function create() {
        // Function to display a form for creating a new post
    }

    public function edit($postId) {
        // Function to edit an existing post
    }

    public function update($postId) {
        // Function to update an existing post
    }

    public function delete($postId) {
        // Function to delete an existing post
    }

    // Additional functions like switch, filter, sort, etc.
}
```

### Step 3: Page Preview (Inside PostService)

```php
public function pagePreview($object) {
    return (object) [
        "obj" => $object,
        "view" => "templates@module@index",
        "meta" => [
            "title" => PROJECT_NAME
        ]
    ];
}
```

### Step 4: Model Class (PostModel)

```php
class PostModel {
    private $tableName = 'posts';
    private $primaryKey = 'id';

    // Define other properties and methods for database interactions
}
```

### Step 5: URLs Class (PostURLs)

```php
class PostURLs {
    public function getRoutes() {
        return [
            [
                "method" => "GET",
                "module" => "Post",
                "url" => "posts/dashboard",
                "function" => "dashboard",
                "authorization" => false
            ],
            [
                "method" => "GET",
                "module" => "Post",
                "url" => "posts/main",
                "function" => "main",
                "authorization" => false
            ],
            [
                "method" => "POST",
                "module" => "Post",
                "url" => "posts/store",
                "function" => "store",
                "authorization" => true
            ],
            // Define other routes as needed
        ];
    }
}
```

### Step 6: Templates Folder

Create a folder named "posts" within the `templates` directory. Inside this folder, you can create template files for displaying posts.

### Step 7: Input Validation and Handling (Inside PostService)

```php
$validationRules = [
    'guide' => ['min_length' => 11, 'max_length' => 14],
];
$validation = $this->validate($_POST, $validationRules);
$errors = $this->validateFormData($validation);

if (!empty($errors)) {
    $this->back($errors);
}

$data = $validation['validated'];

// Now, you can use the validated data in your service logic
```

Please note that this example provides a basic structure for creating a "posts" service. You would need to adapt and extend this structure to fit the specific requirements and complexity of your project. Additionally, you should include the actual implementations of functions, database interactions, and view templates in your code.

It looks like you've outlined some important steps and actions to take after creating a new service in your PHP light-framework. Let's go over each of these actions in more detail:

1. **Input Validation**:

   - You're performing input validation using `$this->validate($_POST, $validationRules)`. This is a good practice to ensure that incoming data meets the expected criteria, which helps prevent security vulnerabilities and data integrity issues.

2. **Filter Guide**:

   - You're using `preg_match` to filter the guide. This is useful for checking if the guide follows a specific pattern, providing data integrity and security.

3. **Model Service**:

   - You mentioned using methods like `save`, `getOne`, `getMany`, `delete`, and `performJoin` from your model service. These are essential database operations and help maintain data consistency and retrieval.

4. **Response Actions**:

   - You're handling responses appropriately based on the outcome of your actions. Using HTTP status codes like 200 and 500 is a good practice for conveying the result of the operation.
   - You're also creating logs to track specific events, which is important for debugging and auditing.

5. **Send Mail**:
   - Sending emails is a common functionality for many web applications. You're using an email sender class to send emails, which is a good way to encapsulate email functionality.

These actions are all integral parts of building a robust and secure web application. However, make sure to consider the following additional points:

- **Exception Handling**: Consider adding try-catch blocks to handle exceptions gracefully, especially when dealing with database operations and email sending. This ensures that errors are captured and handled appropriately.

- **Security**: Ensure that your input validation is comprehensive and covers all potential security vulnerabilities, such as SQL injection, cross-site scripting (XSS), and CSRF attacks.

- **Documentation**: Document these actions and best practices within your light-framework's documentation. This will help other developers understand how to use these features effectively.

- **Testing**: Implement unit tests and integration tests to verify that these actions work as expected. Automated testing helps catch regressions and ensures the reliability of your code.

- **Logging**: Extend your logging system to capture more detailed information, such as request details, timestamps, and user information, to aid in debugging and auditing.

By following these guidelines and continually improving your codebase, you'll be able to create a more stable and maintainable PHP light-framework for building web applications.

# of Arabic

لإنشاء خدمة جديدة ضمن مشروع الإطار الخاص بك في PHP ، يُعتبر إنشاء مستند مهم للمساعدة في فهم كيفية توسيع واستخدام الإطار الخاص بك بفعالية. دعونا نقسم عملية إنشاء المستند لإضافة خدمة جديدة إلى مشروع الإطار الخاص بك إلى خطوات.

## إنشاء مستند لإضافة خدمة جديدة إلى إطار PHP الخاص بك

### مقدمة

ابدأ المستند الخاص بك بتقديم هدف هذا المستند: إنشاء خدمة جديدة ضمن إطار PHP الخاص بك. شرح دور الخدمات في تعزيز قدرات المشروع وصف دورهم في تحسين قدرات المشروع.

### الشروط الأساسية

قم بتوضيح أي شروط أساسية يجب أن يتوفرها المطورون قبل محاولة إنشاء خدمة جديدة. قد تتضمن هذه المعرفة بلغة PHP وهيكل المشروع والمعرفة بالخدمات الحالية.

### الخطوة 1: إنشاء مجلد جديد

1.1. في دليل `modules` ، قم بإنشاء مجلد جديد بالاسم الجمعي الذي يمثل الخدمة الجديدة. على سبيل المثال ، إذا كنت تقوم بإنشاء خدمة "المدونة" ، فقم بتسمية المجلد "blogs".

### الخطوة 2: إنشاء صف الخدمة الرئيسي

2.1. داخل مجلد الخدمة ، قم بإنشاء صف PHP يعمل كمفرد للخدمة. اسم الصف يجب أن يكون في الشكل المفرد ويتناسب مع خدمتك. على سبيل المثال ، إذا كانت خدمتك للمدونات ، فإن اسم الصف يمكن أن يكون "BlogService".

2.2. نفذ الأساليب والخصائص اللازمة في صف الخدمة التي ستحتوي على وظائف الخدمة الرئيسية. يمكن أن تتضمن هذه الأساليب وظائف لعمليات CRUD واسترجاع البيانات وأي ميزات محددة تتعلق بالخدمة.

2.3. تأكد من أن صف الخدمة يمتد من صف الإطار الأساسي أو الواجهات حسب الحاجة للتوافق.

### الخطوة 3: إنشاء صف النموذج للخدمة

3.1. في نفس مجلد الخدمة ، قم بإنشاء صف النموذج الذي يتعامل مع تفاعلات قاعدة البيانات للخدمة. اسم النموذج يجب أن يكون مناسبًا ، مثل "BlogModel".

3.2. يجب أن يمتد صف النموذج من صف النموذج الأساسي للاتصال بقاعدة البيانات. قم بتنفيذ الأساليب للتفاعل مع قاعدة البيانات ، مثل الاستعلام عن وتحديث أو حذف السجلات المتعلقة بالخدمة.

3.3. قم بتعريف هيكل الجدول في قاعدة البيانات والعلاقات المحددة بينها في صف النموذج.

### الخطوة 4: إنشاء صف الروابط

4.1. في دليل التوجيه الأساسي ، قم بإنشاء ملف توجيه جديد للخدمة إذا لم يكن موجودًا بالفعل. اسمح للملف بالاسم المناسب ، مثل "blogs.php".

4.2. قم بتعريف المسارات للخدمة الجديدة في ملف التوجيه. حدد أنماط عناوين URL وأساليب HTTP والأفعال المطابقة أو أساليب الخدمة.

### الخطوة 5: إنشاء القوالب

5.1. في دليل "القوالب" ، قم بإنشاء مجلدًا لقوالب الخدمة الخاصة بك إذا لم يكن موجودًا بالفعل. اسمح للمجلد بالاسم المناسب ، مثل "blogs".

5.2. داخل مجلد القوالب الخاص بالخدمة ، يمكنك إنشاء ملفات قوالب للعرض الواجهة الرسومية للخدمة الخاصة بك.

### الخطوة 6: إضافة التحقق من الإدخال والتحكم

6.1. قم بتعريف قواعد التحقق من الإدخال للبيانات الواردة ، مثل `['guide' => ['min_length' => 11, 'max_length' => 14]]`.

6.2. قم بتنفيذ التحقق من الإدخال باستخدام `validate($_POST, $validationRules)` للتحقق من مطابقة البيانات المدخلة للقواعد.

6.3. قم بمعالجة أي أخطاء وإرجاعها إذا كانت موجودة باستخدام `$this->back($errors)`.

6.4. استخدم البيانات المحققة للمتابعة في منطق الخدمة الخاص بك.

يرجى ملاحظة أن هذا المثال يقدم هيكلًا أساسيًا لإنشاء خدمة "المدونة". ستحتاج إلى تكييف وتوسيع هذا الهيكل لتناسب متطلبات مشروعك بشكل محدد. بالإضافة إلى ذلك ، يجب عليك تضمين تنفيذات الوظائف الفعلية وتفاعلات قاعدة البيانات وقوالب العرض الفعلية في الشفرة الخاصة بك.

````markdown
لإنشاء خدمة جديدة في إطار PHP الخاص بك، يجب عليك اتباع الخطوات التالية. سنستخدم كخدمة مثال "المدونات" لهذا الشرح.

## الخطوة 1: إنشاء المجلد والصفوف

1.1. قم بإنشاء مجلد للخدمة الجديدة داخل الدليل `modules`. سنسمي المجلد "blogs".

1.2. قم بإنشاء الصفوف التالية:

- `BlogService` (صف الخدمة الرئيسي)
- `BlogRequests` (صف لمعالجة الطلبات)
- `BlogModel` (صف النموذج لهيكل قاعدة البيانات)
- `BlogURLs` (صف لتوجيه الروابط)

## الخطوة 2: صف الخدمة (BlogService)

```php
class BlogService {
    private $module;

    public function __construct($module) {
        $this->module = $module;
    }

    public function dashboard() {
        // منطق الصفحة الرئيسية لوحة التحكم
    }

    public function main() {
        // منطق الصفحة الرئيسية للزوار
    }

    public function store() {
        // إنشاء مدونة جديدة
    }

    public function create() {
        // عرض نموذج لإنشاء مدونة جديدة
    }

    public function edit($postId) {
        // تحرير مدونة موجودة
    }

    public function update($postId) {
        // تحديث مدونة موجودة
    }

    public function delete($postId) {
        // حذف مدونة موجودة
    }

    // وظائف إضافية مثل التبديل، التصفية، الترتيب، إلخ.
}
```
````

## الخطوة 3: معاينة الصفحة (داخل BlogService)

```php
public function pagePreview($object) {
    return (object) [
        "data" => $object,
        "view" => "templates@module@index",
        "meta" => [
            "title" => PROJECT_NAME
        ]
    ];
}
```

## الخطوة 4: صف النموذج (BlogModel)

```php
class BlogModel {
    private $tableName = 'المدونات';
    private $primaryKey = 'المفتاح_الرئيسي';

    // تعريف الخصائص والأساليب الأخرى للتفاعل مع قاعدة البيانات
}
```

## الخطوة 5: صف الروابط (BlogURLs)

```php
class BlogURLs {
    public function getRoutes() {
        return [
            [
                "method" => "GET",
                "module" => "Blog",
                "url" => "المدونات/لوحة-التحكم",
                "function" => "dashboard",
                "authorization" => false
            ],
            [
                "method" => "GET",
                "module" => "Blog",
                "url" => "المدونات/الصفحة-الرئيسية",
                "function" => "main",
                "authorization" => false
            ],
            [
                "method" => "POST",
                "module" => "Blog",
                "url" => "المدونات/إنشاء",
                "function" => "store",
                "authorization" => true
            ],
            // تعريف المزيد من الروابط حسب الحاجة
        ];
    }
}
```

## الخطوة 6: مجلد القوالب

قم بإنشاء مجلد بالاسم "blogs" داخل الدليل `templates`. داخل هذا المجلد، يمكنك إنشاء ملفات القوالب الخاصة بعرض المدونات.

## الخطوة 7: التحقق من الإدخال والمعالجة (داخل BlogService)

```php
$validationRules = [
    'guide' => ['min_length' => 11, 'max_length' => 14],
];
$validation = $this->validate($_POST, $validationRules);
$errors = $this->validateFormData($validation);

if (!empty($errors)) {
    $this->back($errors);
}

$data = $validation['validated'];

// الآن، يمكنك استخدام البيانات المحققة في منطق الخدمة الخاص بك
```

يرجى ملاحظة أن هذا المثال يوفر هيكلًا أساسيًا لإنشاء خدمة "المدونة". ستحتاج إلى تكييف وتوسيع هذا الهيكل لتناسب متطلبات مشروعك الخاص بشكل محدد. بالإضافة إلى ذلك، يجب عليك تضمين تنفيذات الوظائف الفعلية وتفاعلات قاعدة البيانات وقوالب العرض الفعلية في الشفرة الخاصة بك.

```

هذا النص يقدم نفس المعلومات الموجودة في المحتوى الأصلي ولكنه مترجم إلى اللغة العربية،

 مع أمثلة للشفرة المصدرية.
```
