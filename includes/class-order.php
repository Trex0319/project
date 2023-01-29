<?php

class Orders
{
    public $database;

    public function __construct()
    {
        try {
            $this->database = connectToDB();
        } catch ( PDOException $error ) {
            die("Database connection failed");
        }
    }

    public function createNewOrder( 
        $user_id, // find out who make the order 
        $total_amount = 0, // find out what's the total amount
        $product_in_cart = [] // get the products in the order 
        )
        {
            $statement = $this->database->prepare(
                'INSERT INTO orders (user_id, total_amount, transaction_id)
                VALUES (:user_id, :total_amount, :transaction_id)'
            );

            $statement->execute([
                'user_id' => $user_id,
                'total_amount' => $total_amount,
                'transaction_id' => ''
            ]);

            $order_id = $this->database->lastInsertId();

            foreach( $product_in_cart as $product_id => $quantity )
            {
                $statement = $this->database->prepare(
                    'INSERT INTO orders_products (order_id, product_id, quantity)
                    VALUES (:order_id, :product_id, :quantity)'
                );

                $statement->execute([
                    'order_id' => $order_id,
                    'product_id' => $product_id,
                    'quantity' => $quantity
                ]);
            }

            $bill_url = '';

            $response = callAPI(
                BILLPLZ_API_URL . 'v3/bills', // https://www.billplz-sandbox.com/api/v3/bills
                'POST',
                [
                    'collection_id' => BILLPLZ_COLLECTION_ID,
                    'email' => $_SESSION['user']['email'],
                    'name' => $_SESSION['user']['email'],
                    'amount' => $total_amount * 100,
                    'callback_url' => 'http://simple-store.local/payment-callback',
                    'description' => 'Order #' . $order_id, // Order #3,
                    'redirect_url' => 'http://simple-store.local/payment-verification'
                ],
                [
                    'Content-Type: application/json',
                    'Authorization: Basic ' . base64_encode( BILLPLZ_API_KEY . ':')
                ]
    
            );

            // var_dump( $response );

            if ( isset( $response->id ) ) {
                $statement = $this->database->prepare(
                    'UPDATE orders SET transaction_id = :transaction_id
                    WHERE id = :order_id'
                );
                $statement->execute([
                    'transaction_id' => $response->id,
                    'order_id' => $order_id
                ]);
            }

            if ( isset( $response->url ) ) {
                $bill_url = $response->url;
            }

            return $bill_url;
        }

        public function updateOrder( $transaction_id, $status )
        {
            $statement = $this->database->prepare(
                'UPDATE orders SET status = :status WHERE transaction_id = :transaction_id'
            );

            $statement->execute([
                'status' => $status,
                'transaction_id' => $transaction_id
            ]);
        }

        public function listOrders( $user_id )
        {
            $statement = $this->database->prepare('SELECT * FROM orders WHERE user_id = :user_id ORDER BY id DESC');
            $statement->execute([
                'user_id' => $user_id
            ]);

            return $statement->fetchAll(PDO::FETCH_OBJ);
        }

        public function listProductsinOrder( $order_id )
        {
            $statement = $this->database->prepare(
                'SELECT
                products.id,
                products.name, 
                orders_products.order_id,
                orders_products.quantity
                FROM orders_products
                JOIN products
                ON orders_products.product_id = products.id
                WHERE order_id = :order_id'
            );
            $statement->execute([
                'order_id' => $order_id
            ]);

            return $statement->fetchAll(PDO::FETCH_OBJ);
        }
}