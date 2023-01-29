<?php

    session_start();

    require "includes/functions.php";
    require "includes/class-order.php";

    $orders = new Orders();

    // make sure the user already logged in
    if ( !isLoggedIn() ) {
      header('Location: /login');
      exit;
    }

    $user_id = $_SESSION['user']['id'];
    
    require "parts/header.php";
?>
    <div class="container mt-5 mb-2 mx-auto" style="max-width: 900px;">
      <div class="min-vh-100">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h1 class="h1">My Orders</h1>
        </div>

        <!-- List of orders placed by user in table format -->
        <table
          class="table table-hover table-bordered table-striped table-light"
        >
          <thead>
            <tr>
              <th scope="col">Order ID</th>
              <th scope="col">Products</th>
              <th scope="col">Total Amount</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
          <?php foreach( $orders->listOrders( $user_id ) as $order ) : ?>
            <tr>
              <th scope="row"><?php echo $order->id ?></th>
              <td>
                <ul class="list-unstyled">
                  <?php foreach(
                    $orders->listProductsinOrder( $order->id ) as $product ) : ?>
                    <li>
                      <?php echo $product->name ?>
                      (<?php echo $product->quantity ?>)
                    </li>
                  <?php endforeach; ?>
                </ul>
              </td>
              <td>$<?php echo $order->total_amount ?></td>
              <td><?php echo $order->status ?></td>
            </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <div class="d-flex justify-content-between align-items-center my-3">
          <a href="/" class="btn btn-light btn-sm"
            >Continue Shopping</a
          >
        </div>
      </div>

      <!-- footer -->
      <div class="d-flex justify-content-between align-items-center pt-4 pb-2">
        <div class="text-muted small">
          © 2022 <a href="/" class="text-muted">My Store</a>
        </div>
        <div class="d-flex align-items-center gap-3">
          <a href="/login" class="btn btn-light btn-sm">Login</a>
          <a href="/signup" class="btn btn-light btn-sm">Sign Up</a>
          <a href="/orders" class="btn btn-light btn-sm">My Orders</a>
        </div>
      </div>
    </div>

<?php

    require "parts/footer.php";