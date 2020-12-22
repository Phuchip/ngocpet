<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Bài 19: Chi tiết sản phẩm</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    <body>
        <?php
        include './connect_db.php';
        $result = mysqli_query($con, "SELECT * FROM tbl_san_pham WHERE `id_san_pham` = ".$_GET['id']);
        $product = mysqli_fetch_assoc($result);
        $imgLibrary = mysqli_query($con, "SELECT * FROM tbl_san_pham WHERE `anh_minh_hoa` = ".$_GET['id']);
        $product['images'] = mysqli_fetch_all($imgLibrary, MYSQLI_ASSOC);
        ?>
        <div class="container">
            <h2>Chi tiết sản phẩm</h2>
            <div id="product-detail">
                <div id="product-img">
                    <img src="<?=$product['anh_minh_hoa']?>" />
                </div>
                <div id="product-info">
                    <h1><?=$product['ten_san_pham']?></h1>
                    <label>Giá: </label><span class="product-price"><?= ($product['gia_moi']) ?> VND</span><br/>
                    <form id="add-to-cart-form" action="cart.php?action=add" method="POST">
                        <input type="text" value="1" name="quantity[<?=$product['id']?>]" size="2" /><br/>
                        <input type="submit" value="Mua sản phẩm" />
                    </form>
                    <?php if(!empty($product['images'])){ ?>
                    <div id="gallery">
                        <ul>
                            <?php foreach($product['images'] as $img) { ?>
                                <li><img src="<?=$img['path']?>" /></li>
                            <?php } ?>
                        </ul>
                    </div>
                    <?php } ?>
                </div>
                <div class="clear-both"></div>
                <?=$product['noi_dung']?>
            </div>
        </div>
    </body>
</html>