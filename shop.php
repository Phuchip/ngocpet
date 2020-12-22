<?php
/*
Author: Javed Ur Rehman
Website: https://www.allphptricks.com
*/
session_start();
include('db.php');
$status="";
if (isset($_POST['code']) && $_POST['code']!=""){
$code = $_POST['code'];
$result = mysqli_query($con,"SELECT * FROM `products` WHERE `code`='$code'");
$row = mysqli_fetch_assoc($result);
$name = $row['name'];
$code = $row['code'];
$price = $row['price'];
$image = $row['image'];

$cartArray = array(
  $code=>array(
  'name'=>$name,
  'code'=>$code,
  'price'=>$price,
  'quantity'=>1,
  'image'=>$image)
);

if(empty($_SESSION["shopping_cart"])) {
  $_SESSION["shopping_cart"] = $cartArray;
  $status = "<div class='box'>Product is added to your cart!</div>";
}else{
  $array_keys = array_keys($_SESSION["shopping_cart"]);
  if(in_array($code,$array_keys)) {
    $status = "<div class='box' style='color:red;'>
    Product is already added to your cart!</div>";  
  } else {
  $_SESSION["shopping_cart"] = array_merge($_SESSION["shopping_cart"],$cartArray);
  $status = "<div class='box'>Product is added to your cart!</div>";
  }

  }
}
?>
<!DOCTYPE php>
<php>
    <head>
        <title>Website Pet</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- ========================================================================================== -->
        <!-- CSS -->
        <!-- ========================================================================================== -->
        <link href="public/reset.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/carousel/owl.carousel.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/carousel/owl.theme.css" rel="stylesheet" type="text/css"/>
        <link href="public/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="public/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- ========================================================================================== -->
        <!-- JAVACRIPT -->
        <!-- ========================================================================================== -->
        <script src="public/js/jquery-2.2.4.min.js" type="text/javascript"></script>
        <script src="public/js/elevatezoom-master/jquery.elevatezoom.js" type="text/javascript"></script>
        <script src="public/js/carousel/owl.carousel.js" type="text/javascript"></script>
        <script src="public/js/main.js" type="text/javascript"></script>
        
        <style type="text/css">
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
        </style>


        <div id="site">
            <div id="container">
                <!-- Header -->
                <div id="header-wp">
                    <div id="head-top" class="clearfix">
                        <div class="wp-inner">
                            <a href="" title="" id="payment-link" class="fl-left">Hình thức thanh toán</a>
                            <div id="main-menu-wp" class="fl-right">
                                <ul id="main-menu" class="clearfix">
                                    <li>
                                        <a href="login.php" title="" id="login">Đăng nhập</a>
                                    </li>
                                    <li>
                                        <a title="">hoặc</a>
                                    </li>
                                    <li>
                                        <a href="registration.php" title="" id="res">Đăng ký</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div id="head-body" class="clearfix">
                        <div class="wp-inner">
                            <a href="index.php" title="" id="logo" class="fl-left"><img src="img/dc.png"/></a>
                            <div id="search-wp" class="fl-left">
                                <form method="get" action="search.php">
                                    <input type="text" name="search_key" id="s" placeholder="Nhập từ khóa tìm kiếm tại đây!">
                                    <button type="submit" id="sm-s">Tìm kiếm</button>
                                </form>
                            </div>
                            <div id="action-wp" class="fl-right">
                                <div id="advisory-wp" class="fl-left">
                                    <span class="title">Tư vấn</span>
                                    <span class="phone">0912870820</span>
                                </div>
                                <div class="zalo-chat-widget" data-oaid="3684917761038414960" data-welcome-message="Rất vui khi được hỗ trợ bạn!" data-autopopup="0" data-width="350" data-height="420"></div>

                                    <script src="https://sp.zalo.me/plugins/sdk.js"></script>
                                <div id="btn-respon" class="fl-right"><i class="fa fa-bars" aria-hidden="true"></i></div>
                               
                              <?php
if(!empty($_SESSION["shopping_cart"])) {
$cart_count = count(array_keys($_SESSION["shopping_cart"]));
?>
                                       <a href="cart.php"> <div id="cart-wp" class="fl-right">
                                    <div id="btn-cart">
                                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                        <span id="num"><?php echo $cart_count; ?></span>
                                    </div>
                                    
                                </div>
                            </a>
                                <?php
                                    }
                                    ;?>

                            </div>
                        </div>
                    </div>
                    <div id="head-bottom" class="clearfix">
                        <div class="wp-inner">
                            <div class="fixnav">
                                <div class="fl-left">
                                    <ul id="main_menu">
                                        <li><a href="index.php" class="active">Trang chủ</a></li>
                                        <li>
                                            <a href="index.php" class="icon">shop</a>
                                            <div>
                                                <div class="nav-column">
                                                    <h3>Shop cho chó</h3>
                                                    <ul>
                                                        <li><a href="index.php">Thức ăn</a></li>
                                                        <li><a href="index.php">Quần áo cho chó</a></li>
                                                        <li><a href="index.php">Vòng cổ, dây dắt, rọ mõm</a></li>
                                                        <li><a href="index.php">Phụ kiện khác</a></li>
                                                    </ul>
                                                </div>

                                                <div class="nav-column">
                                                    <h3>Shop cho mèo</h3>
                                                    <ul>
                                                        <li><a href="index.php">Thức ăn</a></li>
                                                        <li><a href="index.php">Quần áo cho mèo</a></li>
                                                        <li><a href="index.php">Vòng cổ, dây dắt, rọ mõm</a></li>
                                                        <li><a href="index.php">Phụ kiện khác</a></li>
                                                    </ul>
                                                </div>

                                                <div class="nav-column">
                                                    <h3>Shop vật nuôi khác</h3>
                                                    <ul>
                                                        <li><a href="index.php">Chim</a></li>
                                                        <li><a href="index.php">Hamster</a></li>
                                                        <li><a href="index.php">Thú cưng nhỏ</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li><a href="gioithieu.php" class="icon">Giới thiệu</a></li>
                                        <li><a href="dichvu.php" class="icon">Dịch vụ </a></li>
                                        <li><a href="Lienhe.php" class="icon">Liên hệ</a></li>
                                        <li><a href="tin_tuc.php" class="icon">Tin tức</a></li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End header -->

<?php
if(!empty($_SESSION["shopping_cart"])) {
$cart_count = count(array_keys($_SESSION["shopping_cart"]));
?>
<div class="cart_div">
<a href="cart.php"><img src="cart-icon.png" /> Cart<span><?php echo $cart_count; ?></span></a>
</div>
<?php
}

$result = mysqli_query($con,"SELECT * FROM `products`");
while($row = mysqli_fetch_assoc($result)){
    echo "<div class='product_wrapper'>
        <form method='post' action=''>
        <input type='hidden' name='code' value=".$row['code']." />
        <div class='image'><img src='".$row['image']."' /></div>
        <div class='name'>".$row['name']."</div>
          <div class='price'>".$row['price']."</div>
        <button type='submit' class='buy'>Buy Now</button>
        </form>
          </div>";
        }
mysqli_close($con);
?>

<div style="clear:both;"></div>

<div class="message_box" style="margin:10px 0px;">
<?php echo $status; ?>
</div>

 <div class="hotline-phone-ring-wrap">
    <div class="hotline-phone-ring">
        <div class="hotline-phone-ring-circle"></div>
        <div class="hotline-phone-ring-circle-fill"></div>
        <div class="hotline-phone-ring-img-circle">
        <a href="tel:0912870820" class="pps-btn-img">
            <img src="https://nguyenhung.net/wp-content/uploads/2019/05/icon-call-nh.png" alt="Gọi điện thoại" width="50">
        </a>
        </div>
    </div>
    <div class="hotline-bar">
        <a href="tel:0912870820">
            <span class="text-hotline">0912870820</span>
        </a>
    </div>
</div>
      <style>
.hotline-phone-ring-wrap {
  position: fixed;
  bottom: 0;
  left: 0;
  z-index: 999999;
}
.hotline-phone-ring {
  position: relative;
  visibility: visible;
  background-color: transparent;
  width: 110px;
  height: 110px;
  cursor: pointer;
  z-index: 11;
  -webkit-backface-visibility: hidden;
  -webkit-transform: translateZ(0);
  transition: visibility .5s;
  left: 0;
  bottom: 0;
  display: block;
}
.hotline-phone-ring-circle {
    width: 85px;
  height: 85px;
  top: 10px;
  left: 10px;
  position: absolute;
  background-color: transparent;
  border-radius: 100%;
  border: 2px solid #e60808;
  -webkit-animation: phonering-alo-circle-anim 1.2s infinite ease-in-out;
  animation: phonering-alo-circle-anim 1.2s infinite ease-in-out;
  transition: all .5s;
  -webkit-transform-origin: 50% 50%;
  -ms-transform-origin: 50% 50%;
  transform-origin: 50% 50%;
  opacity: 0.5;
}
.hotline-phone-ring-circle-fill {
    width: 55px;
  height: 55px;
  top: 25px;
  left: 25px;
  position: absolute;
  background-color: rgba(230, 8, 8, 0.7);
  border-radius: 100%;
  border: 2px solid transparent;
  -webkit-animation: phonering-alo-circle-fill-anim 2.3s infinite ease-in-out;
  animation: phonering-alo-circle-fill-anim 2.3s infinite ease-in-out;
  transition: all .5s;
  -webkit-transform-origin: 50% 50%;
  -ms-transform-origin: 50% 50%;
  transform-origin: 50% 50%;
}
.hotline-phone-ring-img-circle {
    background-color: #e60808;
    width: 33px;
  height: 33px;
  top: 37px;
  left: 37px;
  position: absolute;
  background-size: 20px;
  border-radius: 100%;
  border: 2px solid transparent;
  -webkit-animation: phonering-alo-circle-img-anim 1s infinite ease-in-out;
  animation: phonering-alo-circle-img-anim 1s infinite ease-in-out;
  -webkit-transform-origin: 50% 50%;
  -ms-transform-origin: 50% 50%;
  transform-origin: 50% 50%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  justify-content: center;
}
.hotline-phone-ring-img-circle .pps-btn-img {
    display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
}
.hotline-phone-ring-img-circle .pps-btn-img img {
    width: 20px;
    height: 20px;
}
.hotline-bar {
  position: absolute;
  background: rgba(230, 8, 8, 0.75);
  height: 40px;
  width: 160px;
  line-height: 40px;
  border-radius: 3px;
  padding: 0 10px;
  background-size: 100%;
  cursor: pointer;
  transition: all 0.8s;
  -webkit-transition: all 0.8s;
  z-index: 9;
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.1);
  border-radius: 50px !important;
  /* width: 175px !important; */
  left: 33px;
  bottom: 37px;
}
.hotline-bar > a {
  color: #fff;
  text-decoration: none;
  font-size: 15px;
  font-weight: bold;
  text-indent: 50px;
  display: block;
  letter-spacing: 1px;
  line-height: 40px;
  font-family: Arial;
}
.hotline-bar > a:hover,
.hotline-bar > a:active {
  color: #fff;
}
@-webkit-keyframes phonering-alo-circle-anim {
  0% {
    -webkit-transform: rotate(0) scale(0.5) skew(1deg);
    -webkit-opacity: 0.1;
  }
  30% {
    -webkit-transform: rotate(0) scale(0.7) skew(1deg);
    -webkit-opacity: 0.5;
  }
  100% {
    -webkit-transform: rotate(0) scale(1) skew(1deg);
    -webkit-opacity: 0.1;
  }
}
@-webkit-keyframes phonering-alo-circle-fill-anim {
  0% {
    -webkit-transform: rotate(0) scale(0.7) skew(1deg);
    opacity: 0.6;
  }
  50% {
    -webkit-transform: rotate(0) scale(1) skew(1deg);
    opacity: 0.6;
  }
  100% {
    -webkit-transform: rotate(0) scale(0.7) skew(1deg);
    opacity: 0.6;
  }
}
@-webkit-keyframes phonering-alo-circle-img-anim {
  0% {
    -webkit-transform: rotate(0) scale(1) skew(1deg);
  }
  10% {
    -webkit-transform: rotate(-25deg) scale(1) skew(1deg);
  }
  20% {
    -webkit-transform: rotate(25deg) scale(1) skew(1deg);
  }
  30% {
    -webkit-transform: rotate(-25deg) scale(1) skew(1deg);
  }
  40% {
    -webkit-transform: rotate(25deg) scale(1) skew(1deg);
  }
  50% {
    -webkit-transform: rotate(0) scale(1) skew(1deg);
  }
  100% {
    -webkit-transform: rotate(0) scale(1) skew(1deg);
  }
}
@media (max-width: 768px) {
  .hotline-bar {
    display: none;
  }
}
</style>
<div class="hotline-phone-ring-wrap">
    <div class="hotline-phone-ring">
        <div class="hotline-phone-ring-circle"></div>
        <div class="hotline-phone-ring-circle-fill"></div>
        <div class="hotline-phone-ring-img-circle">
        <a href="tel:0912870820" class="pps-btn-img">
            <img src="https://nguyenhung.net/wp-content/uploads/2019/05/icon-call-nh.png" alt="Gọi điện thoại" width="50">
        </a>
        </div>
    </div>
    <div class="hotline-bar">
        <a href="tel:0912870820">
            <span class="text-hotline">0912870820</span>
        </a>
    </div>
</div>  
            <div id="footer-wp">
                <div id="foot-body">
                    <div class="wp-inner clearfix">
                        <div class="block" id="info-company">
                            <h3 class="title">NGỌC PET</h3>
                            <p class="desc">NGỌC PET luôn cung cấp luôn là sản phẩm chính hãng có thông tin rõ ràng, chính sách ưu đãi cực lớn cho khách hàng có thẻ thành viên.</p>
                            <div id="payment">
                                <div class="thumb">
                                    <img src="public/images/img-foot.png" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="block menu-ft" id="info-shop">
                            <h3 class="title">Thông tin cửa hàng</h3>
                            <ul class="list-item">
                                <li>
                                    <p>Chùa Hang- Đồng Hỷ- Thái Nguyên</p>
                                </li>
                                <li>
                                    <p>0912870820</p>
                                </li>
                                <li>
                                    <p>Ngocpet@gmail.com</p>
                                </li>
                            </ul>
                        </div>
                        <div class="block menu-ft policy" id="info-shop">
                            <h3 class="title">Chính sách mua hàng</h3>
                            <ul class="list-item">
                                <li>
                                    <a href="" title="">Quy định - chính sách</a>
                                </li>
                                <li>
                                    <a href="" title="">Chính sách bảo hành - đổi trả</a>
                                </li>
                                <li>
                                    <a href="" title="">Chính sách hội viện</a>
                                </li>
                                <li>
                                    <a href="" title="">Giao hàng - lắp đặt</a>
                                </li>
                            </ul>
                        </div>
                        <div class="block" id="newfeed">
                            <h3 class="title">Bảng tin</h3>
                            <p class="desc">Đăng ký với chung tôi để nhận được thông tin ưu đãi sớm nhất</p>
                            <div id="form-reg">
                                <form method="POST" action="">
                                    <input type="email" name="email" id="email" placeholder="Nhập email tại đây">
                                    <button type="submit" id="sm-reg">Đăng ký</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="foot-bot">
                        <div class="wp-inner">
                            <p id="copyright">© Bản quyền thuộc về Ngọc Pet</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- End footer -->
        </div>
        <script src="https://sp.zalo.me/plugins/sdk.js"></script>
       
    </body>
   <!-- Load Facebook SDK for JavaScript -->
      <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            xfbml            : true,
            version          : 'v7.0'
          });
        };

        (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <!-- Your customer chat code -->
      <div class="fb-customerchat"
        attribution=setup_tool
        page_id="104100647932103"
  logged_in_greeting="Chào bạn ,Mình là Thương"
  logged_out_greeting="Chào bạn ,Mình là Thương">

      </div>
</php>