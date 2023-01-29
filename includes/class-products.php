<?php

class Products
{
    public $database;

    public function __construct()
    {
        try {
            $this->database = connectToDB();
        } catch ( Exception $error ) {
            die("Database Connection Failed");
        }
    }

    public function listAllProducts()
    {
        $product = [];
        // prepare the database, execute, and the fetchAll
        $statement = $this->database->prepare('SELECT * FROM products');
        //execute
        $statement->execute();
        /*
            fetch all data from database
            use PDO::FETCH_OJB if you want array->name
            use PDO::FETCH_ASSOC if you want object ['name']
            or left it empty for pdo::FETCH_BOTH
        */

        //fetchAll
        $products = $statement->fetchAll(PDO::FETCH_OBJ);
        return $products;

    }

        public function findProduct( $product_id )
    {
        // find the product based on given product_id
        $statement = $this->database->prepare("SELECT * from products WHERE id = :id");
        $statement->execute([
            'id' => $product_id
        ]);

        // retrieve the product (array)
        return $statement->fetch(PDO::FETCH_OBJ);
    }
}