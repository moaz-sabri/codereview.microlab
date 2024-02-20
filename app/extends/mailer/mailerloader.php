<?php

namespace App\Extends\Mailer;

use App\Extends\Record\RecordLoader;
use App\Modules\Core\Loader\CryptLoader;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

use App\Utilities\Utilitie;

require_once __DIR__ . "/phpmailer/src/Exception.php";
require_once __DIR__ . "/phpmailer/src/PHPMailer.php";
require_once __DIR__ . "/phpmailer/src/SMTP.php";

class MailerLoader extends Utilitie
{

    public static function remidHistory($id)
    {
        $reminderModel = new MailerModel;
        $reminderModel->count = 50;
        $reminderModel->sort = 'hmail_updated_at';
        $reminderModel->conditions = [['hmail_own', '=', $id]];
        $result = $reminderModel->get();

        return $result;
    }

    private static function getEmailContent(object $info, string $langugae)
    {
        // Load and customize your email template
        ob_start(); // Start output buffering

        $source = STORAGE . "emails/{$langugae}/{$info->template}.html";

        if (file_exists($source)) :
            include $source; // Include the HTML template file

            $emailContent = ob_get_clean(); // Get the template content
            $emailContent = str_replace('[user_name]', $info->name, $emailContent);

            // Replace dynamic values
            switch ($info->template) {
                case 'forgotpassword':
                    $emailContent = str_replace('[confirm_url]', $info->confirm_url, $emailContent);
                    break;

                case 'mailbox':
                    $emailContent = str_replace('[your_message]', $info->message, $emailContent);
                    break;

                case 'reminder':
                    if (isset($info->message)) :
                        $emailContent = str_replace('[your_message]', $info->message, $emailContent);
                    else :
                        $emailContent = str_replace('[your_message]', '', $emailContent);
                    endif;
                    if (isset($info->image)) :
                        $emailContent = str_replace('[your_image]', DOMAIN_SOURCE . '/storage/' . $info->image, $emailContent);
                    else :
                        $emailContent = str_replace('[your_image]', 'https://develop.joudev.com/public/assets/logo/s-main-logo.webp', $emailContent);
                    endif;
                    if (isset($info->subject)) :
                        $emailContent = str_replace('[your_subject]', $info->subject, $emailContent);
                    else :
                        $emailContent = str_replace('[your_subject]', 'Erinnerungskalender', $emailContent);
                    endif;
                    break;
            }

            return $emailContent;
        else :
            return false;
        endif;
    }

    static function send(object $info, string $langugae = 'en',  int $owner = null): bool
    {
        $body = self::getEmailContent($info, $langugae);

        if (!$body) return false;

        $hitory = new MailerModel;
        $hitory->column->hmail_guide = self::guide('E');
        $hitory->column->hmail_own = $owner ?? CryptLoader::decrypt('uid');
        $hitory->column->hmail_template = htmlspecialchars($body);
        $hitory->column->hmail_type = $info->type;
        $hitory->column->hmail_status = -1;

        try {
            // Create a new PHPMailer instance
            $mail = new PHPMailer(true);

            // Server settings
            $mail->isSMTP();
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; // Use SSL if required
            $mail->SMTPDebug = EMAIL_DEBUG; // 0 = off (for production use) - 1 = client messages - 2 = client and server messages

            $mail->SMTPAuth = true;
            $mail->Username = EMAIL_USER;
            $mail->Password = EMAIL_PASS;

            $mail->Port = EMAIL_PORT; // TLS only
            $mail->Host = EMAIL_SMTP_HOST; // use $mail->Host = gethostbyname('smtp.gmail.com'); // if your network does not support SMTP over IPv6

            // Recipients
            // your_email@example.com
            $mail->setFrom(EMAIL_ADDRESS, PROJECT_NAME);
            // recipient@example.com
            $mail->addAddress($info->email, $info->name);

            // Content
            $mail->isHTML(true);
            $mail->Subject = $info->subject;
            $mail->Body = $body;

            if ($mail->send() && PRODUCTION) :
                $mail_string = $mail->getSentMIMEMessage();
                $imap_stream = imap_open("{" . EMAIL_IMAP_HOST . "}", EMAIL_USER, EMAIL_PASS);
                imap_append($imap_stream, "{" . EMAIL_IMAP_HOST . "}INBOX.Sent", $mail_string);

                $hitory->column->hmail_status = 1;
                $message = $mail_string;
            else :

                $message = $mail->ErrorInfo;
                $hitory->column->hmail_status = 0;
            endif;

            $hitory->column->hmail_response = $message;

            $e = $hitory->save();

            return true;
        } catch (Exception $e) {
            RecordLoader::log($e, 500, "sd6sf9a78sdf69B");
        }

        if (isset($mail->ErrorInfo)) :
            $message = 'Email could not be sent. Error: ' . $mail->ErrorInfo;
            RecordLoader::log($message, 500, "sd6sf9a78sdf69B");
        endif;

        $hitory->column->hmail_response = $message;
        $hitory->save();
        return false;
    }
}
