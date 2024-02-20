## Create Reminder

This function creates a new reminder in the system.

### Parameters

- `request`: Object - The request object containing the data for the new reminder.

### Input Validation

1. Check if the request contains all the necessary fields for creating a reminder.
2. Validate the input fields to ensure they meet the required criteria:
   - `subject`: Title of the reminder (string, required).
   - `reminder`: Time interval for reminder (string, required).
   - `day`: Start date for the reminder (string, required, format: 'YYYY-MM-DD').
   - `month`: End date for the reminder (string, required, format: 'YYYY-MM-DD').

### Functionality

1. Validate the input data received from the request object.
2. If validation fails, return an error response indicating the validation errors.
3. If validation passes:
   - Create a new `ReminderCalendar` object.
   - Set the `calendar_subject`, `calendar_message`, `calendar_remindertime`, `calendar_date_start`, and `calendar_date_end` attributes of the reminder object.
   - Determine the end date based on the remindertime:
     - If remindertime is '1D' (1 day), set the end date to the next day.
     - If remindertime is '1W' (1 week), set the end date to 1 week later.
     - If remindertime is '2W' (2 weeks), set the end date to 2 weeks later.
     - If remindertime is '4W' (4 weeks), set the end date to 4 weeks later.
   - Save the reminder object to the database.
   - Return a success response with the newly created reminder object.

### Example

```php
/**
 * Create a new reminder.
 *
 * @param Object $request The request object containing reminder data.
 * @return JsonResponse The JsonResponse containing the created reminder object or error message.
 */
public function create(Object $request): JsonResponse
{
    // Validate input data
    $validator = Validator::make($request->all(), [
        'day' => ['required' => true],
        'month' => ['required' => true],
        'subject' => ['required' => true],
        'reminding' => ['required' => true],
    ]);

    // Check for validation errors
    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 400);
    }

    // Create new reminder
    $reminder = new ReminderCalendar();
    $reminder->column->calendar_guide = $this->guide('C');
    $reminder->column->calendar_owner = CryptLoader::decrypt('uid');
    $reminder->column->calendar_subject = $data->subject;
    $reminder->column->calendar_remindertime = $data->reminding;
    $reminder->column->calendar_status = 'RUNNING';

    // Create a DateTime object for the current year, using the provided month and day
    $startDate = new DateTime(date('Y') . '-' . $data->month . '-' . $data->day);

    // Add 1 week to the start date
    $endDate = clone $startDate; // Create a copy of the start date
    $endDate->sub(new DateInterval('P1D')); // Sub the current day
    $endDate->add(new DateInterval('P' . $data->reminding)); // Add reminder date

    // Format the dates as strings
    $reminder->column->calendar_date_start = $startDate->format('Y-m-d');
    $reminder->column->calendar_date_end = $endDate->format('Y-m-d');

    $reminder->save();

    // Return success response
    return new JsonResponse([
        'message' => $this->responseMessage,
        'callback' => $callback ?? false,
    ]);
}
```

## Update Reminder

This function updates an existing reminder in the system.

### Parameters

- `request`: Object - The request object containing the data for updating the reminder.

### Input Validation

1. Check if the request contains all the necessary fields for updating a reminder.
2. Validate the input fields to ensure they meet the required criteria:
   - `subject`: Title of the reminder (string, required).
   - `message`: Description of the reminder (string, optional).
   - `reminder`: Time interval for reminder (string, required).
   - `day`: Start date for the reminder (string, required, format: 'YYYY-MM-DD').
   - `month`: End date for the reminder (string, required, format: 'YYYY-MM-DD').
   - `status`: Status of the reminder (string, required, e.g., 'RUNNING', 'STOP').

### Functionality

1. Validate the input data received from the request object.
2. If validation fails, return an error response indicating the validation errors.
3. If validation passes:
   - Find the reminder object to update based on the provided reminder ID.
   - Update the attributes of the reminder object based on the input data.
   - If an image is uploaded, update the image field accordingly.
   - Save the updated reminder object to the database.
   - Return a success response with the updated reminder object.

### Example

```php
/**
 * Update an existing reminder.
 *
 * @param Object $request The request object containing updated reminder data.
 * @return JsonResponse The JsonResponse containing the updated reminder object or error message.
 */
public function update(Object $request): JsonResponse
{
    // Validate input data
    $validator = Validator::make($request->all(), [
        'day' => ['required' => true],
        'month' => ['required' => true],
        'subject' => ['required' => true],
        'reminding' => ['required' => true],
        'status' => ['required' => true],
        'message' => ['max_length' => 3000],
    ]);

    // Check for validation errors
    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 400);
    }

    // Find the reminder to update
    $reminder = ReminderCalendar::findOrFail($id);

    // Update reminder attributes
    $reminder->calendar_subject = $request->input('calendar_subject');
    $reminder->calendar_message = $request->input('calendar_message');
    $reminder->calendar_remindertime = $request->input('calendar_remindertime');
    $reminder->calendar_date_start = $request->input('calendar_date_start');
    $reminder->calendar_date_end = $request->input('calendar_date_end');
    $reminder->calendar_status = $request->input('calendar_status');

    // If an image is uploaded, update the image field
    if ($request->hasFile('calendar_image')) {
        // Process and save the uploaded image
        // Assuming you have a method to handle image upload and save the path to the reminder object
        $imagePath = $this->uploadImage($request->file('calendar_image'));
        $reminder->calendar_image = $imagePath;
    }

    // Save the updated reminder
    $reminder->save();

    // Return success response
    return new JsonResponse([
        'message' => $this->responseMessage,
        'callback' => $callback ?? false,
    ]);
}

```

## Delete Reminder

This function soft deletes an existing reminder in the system by setting the `deleted_at` date.

### Parameters

- `uid`: Integer - The ID of the reminder to delete.

### Functionality

1. Find the reminder object to delete based on the provided reminder ID.
2. Set the `deleted_at` attribute of the reminder object to the current date and time.
3. Save the updated reminder object to the database, effectively soft deleting it.
4. Return a success response indicating that the reminder has been soft deleted.

### Example

```php
/**
 * Soft delete an existing reminder.
 *
 * @param int $id The ID of the reminder to delete.
 * @return JsonResponse The JsonResponse containing a success message.
 */
public function delete(object $request): JsonResponse
{
    // Find the reminder to delete
    $reminder = ReminderCalendar::findOrFail($id);

    // Soft delete the reminder
    if (isset($request->routeParams->reminder)) :
        $uids = explode(',', $request->routeParams->reminder);

        foreach ($uids as $uid) :
            $reminderModel = new ReminderCalendarModel();
            $reminderModel->conditions = [
                ['calendar_uid', '=', $uid],
                ['calendar_owner', '=', CryptLoader::decrypt('uid')]
            ];

            $reminder = $reminderModel->find();

            if ($reminder) :
                $reminder = $reminderModel->delete();
                $this->statusCode = 200;
            endif;
        endforeach;
    endif;

    // Return success response
    return new JsonResponse([
        'message' => $this->responseMessage,
        'callback' => $callback ?? false,
    ]);
}

```

## View All Reminders

This function retrieves all reminders associated with the current user.

### Parameters

- `request`: Object - The request object containing any additional parameters for filtering or pagination.

### Functionality

1. Retrieve all reminders associated with the current user.
2. Optionally, apply any additional filtering or pagination based on the request parameters.
3. Return a success response containing the list of reminders.

### Example

```php
/**
 * Retrieve all reminders for the current user.
 *
 * @param Object $request The request object containing additional parameters.
 * @return Response The response containing the list of reminders.
 */
public function index(object $request):Response
{
    // Retrieve current user ID or any other identification method
    $reminderModel = new ReminderCalendarModel;
    $reminderModel->conditions = [['calendar_owner', '=', CryptLoader::decrypt('uid')]];

    // Query reminders associated with the current user
    $reminderModel->pagination = true;
    $reminderModel->sort = 'date_start';

    $result = $reminderModel->get();

    // Return success response with reminders
    return (object) [
        'view' => ReminderCalendarUrls::$resource . 'index',
        'data' => ['reminder' => $result],
        'theme' => 'cpanel',
        'meta' => ['title' => "Reminder Calendar"],
        'bscripts' => AutoLoader::getSourceFormAndTable()
    ];
}
```

## Reminder Editor

This UI component allows users to update reminder data such as title, description, reminder time, start date, end date, status, and optionally upload an image.

### Features

1. Display the current reminder data in input fields or text areas for editing.
2. Allow users to modify the reminder title, description, reminder time, start date, end date, and status.
3. Optionally provide a file input field for users to upload a new image for the reminder.
4. Provide a submit button to save the changes made by the user.
5. Optionally provide a cancel button to discard the changes and return to the previous view.

### Example

```html
<form action="/reminders/update" method="POST" enctype="multipart/form-data">
  <!-- Reminder Title -->
  <label for="calendar_subject">Title:</label>
  <input
    type="text"
    id="calendar_subject"
    name="calendar_subject"
    value="Your Reminder Title"
    required
  />

  <!-- Reminder Description -->
  <label for="calendar_message">Description:</label>
  <textarea id="calendar_message" name="calendar_message">
Your Reminder Description</textarea
  >

  <!-- Reminder Time -->
  <label for="calendar_remindertime">Reminder Time:</label>
  <select id="calendar_remindertime" name="calendar_remindertime" required>
    <option value="1D">1 Day</option>
    <option value="1W">1 Week</option>
    <option value="2W">2 Weeks</option>
    <option value="4W">4 Weeks</option>
  </select>

  <!-- Start Date -->
  <label for="calendar_date_start">Start Date:</label>
  <input
    type="date"
    id="calendar_date_start"
    name="calendar_date_start"
    value="2024-08-26"
    required
  />

  <!-- End Date -->
  <label for="calendar_date_end">End Date:</label>
  <input
    type="date"
    id="calendar_date_end"
    name="calendar_date_end"
    value="2025-08-26"
    required
  />

  <!-- Status -->
  <label for="calendar_status">Status:</label>
  <select id="calendar_status" name="calendar_status" required>
    <option value="RUNNING">Running</option>
    <option value="PAUSED">Paused</option>
    <option value="COMPLETED">Completed</option>
  </select>

  <!-- Image Upload -->
  <label for="calendar_image">Upload Image:</label>
  <input type="file" id="calendar_image" name="calendar_image" />

  <!-- Submit Button -->
  <button type="submit">Save Changes</button>

  <!-- Cancel Button (optional) -->
  <button type="button" onclick="window.history.back()">Cancel</button>
</form>
```

<hr>

### Users Table

- `uid`: Primary key
- `name`: User's name
- `email`: User's email
- `password`: User's password (hashed)
- etc..

### ReminderCalendars Table

- `uid`: Primary key
- `calendar_owner`: Foreign key referencing the `id` column of the `users` table
- `calendar_subject`: Title of the reminder
- `calendar_message`: Description of the reminder
- `calendar_remindertime`: Time interval for the reminder
- `calendar_date_start`: Start date for the reminder
- `calendar_date_end`: End date for the reminder
- `calendar_status`: Status of the reminder (e.g., 'RUNNING', 'PAUSED', 'COMPLETED')
- `created_at`: Timestamp when the reminder was created
- `updated_at`: Timestamp when the reminder was last updated
- `deleted_at`: Timestamp when the reminder was soft deleted

### MailsHistories Table

- `uid`: Primary key
- `reminder_calendar_id`: Foreign key referencing the `id` column of the `reminder_calendars` table
- `mail_subject`: Subject of the email sent
- `mail_content`: Content of the email sent
- `sent_at`: Timestamp when the email was sent
- `created_at`: Timestamp when the mail history entry was created
- `updated_at`: Timestamp when the mail history entry was last updated

### Relationships

- Each `ReminderCalendar` belongs to a `User` (owner).
- Each `User` can have many `ReminderCalendars`.
- Each `ReminderCalendar` can have many `MailsHistories`.
- Each `MailsHistory` belongs to a `ReminderCalendar`.

<hr>

## Reminder Cron Job

This cron job is responsible for checking reminders and sending emails if necessary. It performs the following tasks:

1. **Check Reminders**:

   - Query the database for reminders scheduled for the current day.
   - Filter out reminders that have already been sent or have encountered errors during previous attempts.

2. **Send Emails**:

   - For each remaining reminder, compose and send an email to the specified recipient(s) with the reminder details.
   - Handle any errors that may occur during the email sending process and mark the reminder accordingly.

3. **Update MailsHistories**:
   - If the email is sent successfully, save a record in the `MailsHistories` table with a status of -1 (pending) to indicate that the email has been scheduled to be sent.
   - If there is an error during sending, save a record with a status of 0 to indicate that the email sending encountered an error.
   - If the email is successfully sent, update the record with a status of 1 to indicate that the email has been sent successfully.

### Implementation Details

- The cron job is scheduled to run daily at a specific time using the server's cron scheduling system.
- The job is implemented as a PHP script or a Laravel command that can be executed via the command line.
- Error handling is implemented to handle any exceptions or errors that may occur during the reminder checking and email sending process.
- Logging is used to record the execution of the cron job and any errors encountered during the process.

### Example Cron Job Script

```bash
#!/bin/bash

# Change directory to the project root
cd /path/to/your/project

# Run the Laravel artisan command to execute the reminder cron job
php /path/to/your/projec/app/reminder.php
```
