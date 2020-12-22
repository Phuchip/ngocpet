<?php
/*
Author: Javed Ur Rehman
Website: https://www.allphptricks.com
*/
session_start();
$status="";
if (isset($_POST['action']) && $_POST['action']=="remove"){
if(!empty($_SESSION["shopping_cart"])) {
	foreach($_SESSION["shopping_cart"] as $key => $value) {
		if($_POST["code"] == $key){
		unset($_SESSION["shopping_cart"][$key]);
		$status = "<div class='box' style='color:red;'>
		Product is removed from your cart!</div>";
		}
		if(empty($_SESSION["shopping_cart"]))
		unset($_SESSION["shopping_cart"]);
			}		
		}
}

if (isset($_POST['action']) && $_POST['action']=="change"){
  foreach($_SESSION["shopping_cart"] as &$value){
    if($value['code'] === $_POST["code"]){
        $value['quantity'] = $_POST["quantity"];
        break; // Stop the loop after we've found the product
    }
}
  	
}
?>
<html>
<head>
<title> Shopping Cart </title>
<style>
	.product_wrapper {
	float:left;
	padding: 10px;
	text-align: center;
	}
.product_wrapper:hover {
	box-shadow: 0 0 0 2px #e5e5e5;
	cursor:pointer;
	}
.product_wrapper .name {
	font-weight:bold;
	}
.product_wrapper .buy {
	text-transform: uppercase;
    background: #F68B1E;
    border: 1px solid #F68B1E;
    cursor: pointer;
    color: #fff;
    padding: 8px 40px;
    margin-top: 10px;
}
.product_wrapper .buy:hover {
	background: #f17e0a;
    border-color: #f17e0a;
}
.message_box .box{
	margin: 10px 0px;
    border: 1px solid #2b772e;
    text-align: center;
    font-weight: bold;
    color: #2b772e;
	}
.table td {
	border-bottom: #F0F0F0 1px solid;
	padding: 10px;
	}
.cart_div {
	float:right;
	font-weight:bold;
	position:relative;
	}
.cart_div a {
	color:#000;
	}	
.cart_div span {
	font-size: 12px;
    line-height: 14px;
    background: #F68B1E;
    padding: 2px;
    border: 2px solid #fff;
    border-radius: 50%;
    position: absolute;
    top: -1px;
    left: 13px;
    color: #fff;
    width: 14px;
    height: 13px;
    text-align: center;
	}
.cart .remove {
    background: none;
    border: none;
    color: #0067ab;
    cursor: pointer;
    padding: 0px;
	}
	body {
background-color: lightblue;
}
.cart .remove:hover {
	text-decoration:underline;
	}
</style>

</head>
<body>
<div style="width:700px; margin:50 auto;">
  
<a href="shop.php" ><h2>TIẾP TỤC MUA SẮM</h2>   </a>


<?php
if(!empty($_SESSION["shopping_cart"])) {
$cart_count = count(array_keys($_SESSION["shopping_cart"]));
?>
<div class="cart_div">
<a href="cart.php">
<img src="cart-icon.png" /> Cart
<span><?php echo $cart_count; ?></span></a>
</div>
<?php
}
?>

<div class="cart">
<?php
if(isset($_SESSION["shopping_cart"])){
    $total_price = 0;
?>	
<table class="table">
<tbody>
<tr>
<td></td>
<td>TÊN SẢN PHẨM</td>
<td>SỐ LƯỢNG</td>
<td>GIÁ </td>
<td>TỔNG GIÁ</td>
</tr>	
<?php		
foreach ($_SESSION["shopping_cart"] as $product){
?>
<tr>
<td><img src='<?php echo $product["image"]; ?>' width="50" height="40" /></td>
<td><?php echo $product["name"]; ?><br />
<form method='post' action=''>
<input type='hidden' name='code' value="<?php echo $product["code"]; ?>" />
<input type='hidden' name='action' value="remove" />
<button type='submit' class='remove'>Remove Item</button>
</form>
</td>
<td>
<form method='post' action=''>
<input type='hidden' name='code' value="<?php echo $product["code"]; ?>" />
<input type='hidden' name='action' value="change" />
<select name='quantity' class='quantity' onchange="this.form.submit()">
<option <?php if($product["quantity"]==1) echo "selected";?> value="1">1</option>
<option <?php if($product["quantity"]==2) echo "selected";?> value="2">2</option>
<option <?php if($product["quantity"]==3) echo "selected";?> value="3">3</option>
<option <?php if($product["quantity"]==4) echo "selected";?> value="4">4</option>
<option <?php if($product["quantity"]==5) echo "selected";?> value="5">5</option>
</select>
</form>
</td>
<td><?php echo "".$product["price"]; ?></td>
<td><?php echo "".$product["price"]*$product["quantity"]; ?></td>
</tr>
<?php
$total_price += ($product["price"]*$product["quantity"]);
}
?>
<tr>
<td colspan="5" align="right">
<strong>TOTAL: <?php echo "$".$total_price; ?></strong>
</td>
</tr>
</tbody>
</table>		
  <?php
}else{
	echo "<h3>Your cart is empty!</h3>";
	}
?>
</div>

<div style="clear:both;"></div>

<div class="message_box" style="margin:10px 0px;">
<?php echo $status; ?>
</div>
  <form action="" method="post">
        <label for="fname">Họ Và Tên</label>
        <input type="text" id="name" name="your_name" placeholder="Nhập họ và tên...">
 
        <label for="lname">Địa chỉ</label>
        <input type="text" id="email" name="your_email" placeholder="Nhập địa chỉ...">
 
        <label for="country">Số Điện Thoại</label>
        <input type="text" id="phone" name="your_phone" placeholder="Nhập số điện thoại...">
 
        <label for="address">Ghi chú</label>
       <textarea name="comments" class="form-control" rows="8" cols="50" rows="5" placeholder="Comments"></textarea> 
        <input type="submit" name="submit" value="Đặt hàng">
    </form>
</div>
<style>
.container {
    width: 30%;
    margin: auto;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
    input[type=text] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}
 
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
 
input[type=submit]:hover {
    background-color: #45a049;
}
</style>

<br /><br />

</div>
</body>
</html>