<?php

namespace App\Modules\Emails\Loader;

use App\Modules\Permissions\Loader\CryptLoader;
use App\Modules\Emails\Models\HistoryModel;
use App\Modules\Records\Loader\RecordLoader;
use App\Modules\Settings\Loader\LanguageLoader;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

use App\Utilities\Utilitie;

require_once WEBROOT . "/utilities/phpmailer/src/Exception.php";
require_once WEBROOT . "/utilities/phpmailer/src/PHPMailer.php";
require_once WEBROOT . "/utilities/phpmailer/src/SMTP.php";


class MailLoader extends Utilitie
{

    private static function getEmailContent(object $info, string $langugae)
    {
        // Load and customize your email template
        ob_start(); // Start output buffering

        $source = STORAGE . "emails/{$langugae}/{$info->template}.html";

        if (file_exists($source)) :
            include $source; // Include the HTML template file

            $languageLoader = new LanguageLoader();
            $languageLoader->load($langugae);

            $emailContent = ob_get_clean(); // Get the template content
            $emailContent = str_replace('[user_name]', $info->name, $emailContent);

            // Replace dynamic values
            switch ($info->template) {
                case 'newuser':
                case 'forgotpassword':
                    $emailContent = str_replace('[confirm_url]', $info->confirm_url, $emailContent);
                    break;

                case 'mailbox':
                    $emailContent = str_replace('[your_message]', $info->message, $emailContent);
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

        $hitory = new HistoryModel;
        $hitory->column->guide = self::guide('E');
        $hitory->column->owner = $owner ?? CryptLoader::decrypt('uid');
        $hitory->column->template = htmlspecialchars($body);
        $hitory->column->type = $info->type;
        $hitory->column->status = 0;

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

            if ($mail->send()) :
                $mail_string = $mail->getSentMIMEMessage();
                $imap_stream = imap_open("{" . EMAIL_IMAP_HOST . "}", EMAIL_USER, EMAIL_PASS);
                imap_append($imap_stream, "{" . EMAIL_IMAP_HOST . "}INBOX.Sent", $mail_string);

                $hitory->column->status = 1;
                $message = $mail_string;

                $hitory->column->response = $message;
                $hitory->save();
            endif;

            return true;
        } catch (Exception $e) {
            RecordLoader::log($e, 500, "sd6sf9a78sdf69B");
        }

        if (isset($mail->ErrorInfo)) :
            $message = 'Email could not be sent. Error: ' . $mail->ErrorInfo;
            RecordLoader::log($message, 500, "sd6sf9a78sdf69B");
        endif;

        $hitory->column->response = $message;
        $hitory->save();
        return false;
    }
}
