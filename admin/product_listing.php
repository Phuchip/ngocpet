<?php
include 'header.php';
$config_name = "tbl_san_pham";
$config_title = "sản phẩm";
if (!empty($_SESSION['current_user'])) {
    if(!empty($_GET['action']) && $_GET['action'] == 'search' && !empty($_POST)){
        $_SESSION[$config_name.'_filter'] = $_POST;
        header('Location: '.$config_name.'_listing.php');exit;
    }
    if(!empty($_SESSION[$config_name.'filter'])){
        $where = "";
        foreach ($_SESSION[$config_name.'filter'] as $field => $value) {
            if(!empty($value)){
                switch ($field) {
                    case 'name':
                    $where .= (!empty($where))? " AND "."`".$field."` LIKE '%".$value."%'" : "`".$field."` LIKE '%".$value."%'";
                    break;
                    default:
                    $where .= (!empty($where))? " AND "."`".$field."` = ".$value."": "`".$field."` = ".$value."";
                    break;
                }
            }
        }
        extract($_SESSION[$config_name.'filter']);
    }
    $item_per_page = (!empty($_GET['per_page'])) ? $_GET['per_page'] : 10;
    $current_page = (!empty($_GET['page'])) ? $_GET['page'] : 1;
    $offset = ($current_page - 1) * $item_per_page;
    if(!empty($where)){
        $totalRecords = mysqli_query($con, "SELECT * FROM tbl_san_pham where (".$where.")");
    }else{
        $totalRecords = mysqli_query($con, "SELECT * FROM tbl_san_pham");
    }
    $totalRecords = $totalRecords->num_rows;
    $totalPages = ceil($totalRecords / $item_per_page);
    if(!empty($where)){
        $products = mysqli_query($con, "SELECT * FROM tbl_san_pham where (".$where.") ORDER BY 'id_san_pham' DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
    }else{
        $products = mysqli_query($con, "SELECT * FROM tbl_san_pham ORDER BY 'id_san_pham' DESC LIMIT " . $item_per_page . " OFFSET " . $offset);
    }
    mysqli_close($con);
    ?>
    <div class="main-content">
        <h1>Danh sách <?=$config_title?></h1>
        <div class="listing-items">
            <div class="buttons">
                <a href="quan_tri_san_pham_them.php">Thêm <?=$config_title?></a>
            </div>
            
            <div class="total-items">
                <span>Có tất cả <strong><?=$totalRecords?></strong> <?=$config_title?> trên <strong><?=$totalPages?></strong> trang</span>
            </div>
            <ul>
                <li class="listing-item-heading">
                    <div class="listing-prop listing-img">Ảnh</div>
                    <div class="listing-prop listing-name">Tên <?=$config_title?></div>
                    <div class="listing-prop listing-button">
                        Xóa
                    </div>
                    <div class="listing-prop listing-button">
                        Sửa
                    </div>
                    <div class="listing-prop listing-button">
                        Copy
                    </div>
                    <div class="listing-prop listing-time">Giá cũ</div>
                    <div class="listing-prop listing-time">Giá mới</div>
                    <div class="clear-both"></div>
                </li>
                <?php
                while ($row = mysqli_fetch_array($products)) {
                    ?>
                    <li>
                        <div class="listing-prop listing-img">
                             <img src="../img/<?php 
                                                    if ($row["anh_minh_hoa"]<>"") {
                                                        echo $row["anh_minh_hoa"];
                                                    } else {
                                                        echo "no_image.png";
                                                    }
                                                ;?>"width="650px" height="auto">
                        </div>
                        <div class="listing-prop listing-name"><?= $row['ten_san_pham'] ?></div>
                        <div class="listing-prop listing-button">
                         
                            <a href="quan_tri_san_pham_xoa.php?id=<?= $row['id_san_pham'] ?>">Xóa</a>
                        </div>
                        <div class="listing-prop listing-button">
                             <a href="quan_tri_san_pham_sua.php?id=<?= $row['id_san_pham'] ?>">Sửa</a>
                        </div>
                        <div class="listing-prop listing-button">
                            <a href="./<?=$config_name?>_editing.php?id=<?= $row['id_san_pham'] ?>&task=copy">Copy</a>
                        </div>
                        <div class="listing-prop listing-time"><?= $row['gia_cu'] ?></div>
                        <div class="listing-prop listing-time"><?= $row['gia_moi'] ?></div>
                        <div class="clear-both"></div>
                    </li>
                <?php } ?>
            </ul>
            <?php
            include './pagination.php';
            ?>
            <div class="clear-both"></div>
        </div>
    </div>
    <?php
}
include './footer.php';
?>