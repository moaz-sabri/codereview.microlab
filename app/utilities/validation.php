<?php

namespace App\Utilities;

use DateTime;

trait Validation
{
    /**
     * Validate data based on specified rules.
     *
     * @param object $data   The data to validate.
     * @param array $rules  The validation rules.
     *
     * @return array An array containing 'errors' and 'validated' data.
     */
    public static function validate(object $data, array $rules): array
    {
        $errors = [];
        $validated = [];

        foreach ($rules as $field => $rule) {
            $value = isset($data->$field) ? $data->$field : '';

            if (isset($rule['required']) && $rule['required'] && empty($value)) {
                $errors[$field][] = "{$field} is required.";
            };

            if (!isset($rule['required']) && empty($value)) {
                $validated[$field] = null;
                continue;
            };

            if (isset($rule['type']) && $value && $rule['type'] == 'switch') {
                $validated[$field] = '1';
            } else {
                $validated[$field] = '0';
            }

            if (
                isset($rule['min_length']) &&
                !is_null($value) &&
                strlen($value) < $rule['min_length']
            ) {
                $errors[$field][] = "{$field} must be at least {$rule['min_length']} characters long.";
            } else {
                $validated[$field] = $value;
            }

            if (
                isset($rule['max_length']) &&
                !is_null($value) &&
                strlen($value) > $rule['max_length']
            ) {
                $errors[$field][] = "{$field} must not exceed {$rule['max_length']} characters.";
            } else {
                $validated[$field] = $value;
            }

            if (isset($rule['type'])) {

                switch ($rule['type']) {
                    case 'username':
                        if (!self::validateUsername($value)) {
                            $errors[$field][] = "{$field} is not a valid username address.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'email':
                        if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                            $errors[$field][] = "{$field} is not a valid email address.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'string':
                        $validated[$field] = strip_tags($value);
                        break;
                    case 'int':
                        if (!filter_var($value, FILTER_VALIDATE_INT)) {
                            $errors[$field][] = "{$field} is not a valid integer.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'float':
                        if (!filter_var($value, FILTER_VALIDATE_FLOAT)) {
                            $errors[$field][] = "{$field} is not a valid float.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'boolean':
                        if (!filter_var($value, FILTER_VALIDATE_BOOLEAN)) {
                            $errors[$field][] = "{$field} is not a valid boolean.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'url':
                        if (!filter_var($value, FILTER_VALIDATE_URL)) {
                            $errors[$field][] = "{$field} is not a valid URL.";
                        } else {
                            $validated[$field] = $value;
                        }
                        break;
                    case 'password':
                        $passwordValidation = self::validatePassword($value);
                        if ($passwordValidation === true) {
                            $validated[$field] = $value;
                        } else {
                            $errors[$field][] = $passwordValidation;
                        }
                        break;
                    case 'date':
                        $dateValidation = self::validateDate($value, $rule['date_format'] ?? 'Y-m-d');
                        if ($dateValidation === false) {
                            $errors[$field][] = "{$field} is not a valid date (format: {$rule['date_format']}).";
                        } else {
                            $validated[$field] = $dateValidation;
                        }
                        break;
                    case 'array':
                        $validated[$field] = null;
                        if (is_array($value) && $rule['return'] == "string") :
                            $validated[$field] = implode(', ', $value);
                        elseif ("[" === $value[0] && $rule['return'] == "array") :
                            $validated[$field] = json_decode($value);
                        elseif ("[" === $value[0] && $rule['return'] == "string") :
                            $validated[$field] = $value;
                        endif;

                        // if (isset($rule['required']) && $rule['required'] && !empty($errors[$field])) :
                        //     $errors[$field][] = "{$field} is not a valid Array.";
                        // endif;
                        break;
                }
            }


            if (isset($rule['selection']) && !in_array($value, explode('|', $rule['selection']))) {
                $errors[$field][] = "{$field} is not a valid selection.";
            }
        }

        return [
            "errors" => $errors,
            "validated" => (object) $validated,
        ];
    }


    /**
     * Validate a date string against a specified format.
     *
     * @param string $date       The date string to validate.
     * @param string $dateFormat The expected date format.
     *
     * @return string|bool The validated date string or false if invalid.
     */
    private static function validateDate(string $date, string $dateFormat): string|bool
    {
        $dateTime = DateTime::createFromFormat($dateFormat, $date);
        if ($dateTime && $dateTime->format($dateFormat) === $date) {
            return $date;
        }
        return false;
    }

    /**
     * Validate a password for strength.
     *
     * @param string $password         The password to validate.
     * @param int    $minLength        The minimum length of the password (default is 8).
     * @param bool   $requireUppercase Require at least one uppercase letter (default is true).
     * @param bool   $requireLowercase Require at least one lowercase letter (default is true).
     * @param bool   $requireDigit     Require at least one digit (default is true).
     * @param bool   $requireSpecial   Require at least one special character (default is true).
     *
     * @return string|bool A string describing the error or true if the password is valid.
     */
    public static function validatePassword(
        string $password,
        int $minLength = 8,
        bool $requireUppercase = true,
        bool $requireLowercase = true,
        bool $requireDigit = true,
        bool $requireSpecial = true
    ): string|bool {
        // Check length
        $length = strlen($password);
        if ($length < $minLength) {
            return "Password must be at least {$minLength} characters.";
        }

        // Check for at least one uppercase letter
        if ($requireUppercase && !preg_match('/[A-Z]/', $password)) {
            return "Password must contain at least one uppercase letter.";
        }

        // Check for at least one lowercase letter
        if ($requireLowercase && !preg_match('/[a-z]/', $password)) {
            return "Password must contain at least one lowercase letter.";
        }

        // Check for at least one digit
        if ($requireDigit && !preg_match('/\d/', $password)) {
            return "Password must contain at least one digit.";
        }

        // Check for at least one special character
        if ($requireSpecial && !preg_match('/[!@#$%^&*()\-_=+{}[\]:;\'",.<>?~]/', $password)) {
            return "Password must contain at least one special character.";
        }

        // Password meets all criteria
        return true;
    }


    /**
     * Validate a username.
     *
     * @param string $username          The username to validate.
     * @param int    $minLength         The minimum length of the username (default is 4).
     * @param int    $maxLength         The maximum length of the username (default is 33).
     * @param bool   $allowUnderscores  Allow underscores in the username (default is true).
     * @param int    $maxNumbersAllowed The maximum number of numeric characters allowed (default is 4).
     *
     * @return string|bool A string describing the error or true if the username is valid.
     */
    public static function validateUsername(
        string $username,
        int $minLength = 2,
        int $maxLength = 33,
        bool $allowUnderscores = true,
        int $maxNumbersAllowed = 4
    ): string|bool {
        // Remove spaces and convert to lowercase
        $username = str_replace(' ', '', strtolower($username));

        // Check length
        $length = strlen($username);
        if ($length < $minLength || $length > $maxLength) {
            return "Username must be between {$minLength} and {$maxLength} characters.";
        }

        // Check for special characters and underscores if not allowed
        if (!$allowUnderscores && preg_match('/[^a-z0-9]/', $username)) {
            return "Username must contain only lowercase letters and numbers.";
        }

        // Check for the number of numeric characters
        $numericCount = preg_match_all('/\d/', $username);
        if ($numericCount > $maxNumbersAllowed) {
            return "Username can have at most {$maxNumbersAllowed} numeric characters.";
        }

        return true;
    }


    /**
     * Generate a formatted error message string from a validation array.
     *
     * @param array $validation An array of validation errors.
     *                         Example: ['field1' => ['Error 1', 'Error 2'], 'field2' => ['Error 3']]
     * @param string $delimiter The delimiter to use between error messages (default is '<br>').
     *
     * @return string The formatted error message string.
     */
    public static function validateFormData(array $validation): string
    {
        $errors = '';

        if ($validation['errors']) :
            foreach ($validation['errors'] as $fieldErrors) :
                foreach ($fieldErrors as $error) :
                    $errors .= $error . '<br>';
                endforeach;
            endforeach;
        endif;

        return $errors;
    }
}
