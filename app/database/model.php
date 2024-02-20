<?php

namespace App\Database;

use App\Utilities\Utilitie;

/**
 * Model Class
 *
 * This class provides a base structure for interacting with database models.
 * It includes default columns, configuration properties, and methods for managing attributes.
 */
trait Model
{
    /**
     * Default Columns
     *
     * An array defining default column names and their initial values for new records.
     *
     * @var array
     */
    public static $defaultColumns = [
        "uid" => null,
        "guide" => null,
        "created_at" => null,
        "updated_at" => null,
        "deleted_at" => null,
    ];

    /**
     * Table Name
     *
     * The name of the database table associated with the model.
     *
     * @var string
     */
    protected string $tableName;

    /**
     * Primary ID
     *
     * The name of the primary key used internally for identification.
     *
     * @var string
     */
    protected string $primaryID = 'uid';

    /**
     * Primary Key
     *
     * The name of the primary key used externally for referencing records.
     *
     * @var string
     */
    protected string $primaryKey = 'guide';

    /**
     * Column Object
     *
     * An object containing attributes representing the columns of the database table.
     *
     * @var object
     */
    protected object $column;

    /**
     * List of Attributes
     *
     * An array specifying attributes to retrieve from the database.
     *
     * @var array
     */
    public array $list = ['name'];

    /**
     * Deep Relationship
     *
     * A boolean indicating whether to retrieve related data recursively.
     *
     * @var bool
     */
    public bool $deep = false;

    /**
     * Conditions for Retrieval
     *
     * An array specifying conditions to apply when retrieving records.
     *
     * @var array|null
     */
    public array | null $conditions = null;

    /**
     * Conditions String
     *
     * A string specifying SQL conditions to apply when retrieving records.
     *
     * @var string|null
     */
    public string | null $conditionsString = null;

    /**
     * Except Attributes
     *
     * An array specifying attributes to exclude when retrieving records.
     *
     * @var array|null
     */
    public array | null $except = null;

    /**
     * Merge Attributes
     *
     * An array specifying additional attributes to merge into the retrieved records.
     *
     * @var array
     */
    public array $merge;

    public array $analysis;

    /**
     * Pagination
     *
     * A boolean indicating whether to enable pagination for record retrieval.
     *
     * @var bool
     */
    public bool $pagination = false;

    /**
     * Current Page
     *
     * The current page number for paginated record retrieval.
     *
     * @var int
     */
    public int $current = 1;
    /**
     * Records Per Page
     *
     * The number of records to retrieve per page during pagination.
     *
     * @var int
     */
    public int $count = 50;

    /**
     * Starting Row
     *
     * The index of the first record to retrieve during pagination.
     *
     * @var int
     */
    public int $startRow = 0;


    /**
     * Sort By
     *
     * The attribute or array of attributes to use for sorting retrieved records.
     *
     * @var string|array
     */
    public string|array $sort = 'updated_at';

    /**
     * Sort Direction
     *
     * The direction (ASC or DESC) to use for sorting retrieved records.
     *
     * @var string
     */
    public string $direction = 'DESC';

    /**
     * SQL Query
     *
     * The raw SQL query string to execute for record retrieval.
     *
     * @var string
     */
    public string $sqlQuery = '';


    /**
     * Attributes Method
     *
     * Creates an object containing attributes with default values merged with custom values.
     *
     * @param array $columns An array of custom column names.
     *
     * @return object An object representing the merged attributes.
     */
    protected function attributes(array $columns): object
    {
        return (object) array_merge(
            self::$defaultColumns,
            array_map(function () {
                return null;
            }, $columns)
        );
    }
}
