<?php

    require "includes/class-products.php";
    require "includes/functions.php";

    $products=new Products();
    $_product= $products->findProduct($_GET['id']);

    require dirname(__DIR__) . '/parts/header.php';
?>
<div class="container mx-auto my-5" style="max-width: 500px;">
    <div class="card h-100">
        <img
            src=<?php echo $_product->image_url ?>
            class="card-img-top"
            alt="Product 1"
        />
        <div class="card-body text-center">
            <h1 class="card-title"><?php echo $_product->name ?></h1>
            <p class="card-text"><?php echo $_product->detail ?></p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item"><?php echo $_product->class ?></li>
            <li class="list-group-item"><?php echo $_product->engine ?></li>
            <li class="list-group-item"><?php echo $_product->hp ?></li>
        </ul>
        <div class="card-body">
        <form
            method="POST"
            action="/cart"
            >
            <input
                type="hidden"
                name="product_id"
                value="<?php echo $_product->id ?>"
            />
            <div class="text-center">
                <button class="btn btn-primary">Add to cart</button>
            </div>

            <div class="text-center">
                <a href="/" class="btn btn-link btn-sm"><i class="bi bi-arrow-left"></i> Back</a>
            </div>
        </form>
</div>
    </div>
</div>
<?php
    
    require dirname(__DIR__) . '/parts/footer.php';