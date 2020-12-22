<!DOCTYPE html>
<html>
<head>
	<title>Sửa sản phẩm</title>
</head>
<body>
	<h1 style="text-align: center; padding-bottom: 20px;">SỬA SẢN PHẨM</h1>
	<form method="POST" action="./quan_tri_san_pham_sua_thuc_hien.php" enctype="multipart/form-data">
	<?php 
		// 1. Chuỗi kết nối đến CSDL
		$ket_noi = mysqli_connect("localhost", "root", "", "ngocpet");
            mysqli_set_charset($ket_noi, 'UTF8');
            if (mysqli_connect_errno()) 
            {
            echo 'Failed to connect to Mysql : '.$mysqli_connect_errno();
            }

		// 2. Lấy ra được ID của tin tức cần xóa
		$id_san_pham=$_GET["id"];
		// echo $id_tin_tuc; exit();

		// 2. Viết câu lệnh SQL để lấy ra tin tức có id thu được như trên
		$sql = "
			SELECT *
			FROM tbl_san_pham
			WHERE id_san_pham='".$id_san_pham."'
		";

		// 4. Thực hiện truy vấn để xóa tin tức trên
		$san_pham = mysqli_query($ket_noi, $sql);

		// 5. Hiển thị dữ liệu lên trang Web
		$row = mysqli_fetch_array($san_pham);
	;?>
		<p>
			Tên sản phẩm:<br>
			<input type="text" name="txtTensanpham" value="<?php echo $row["ten_san_pham"];?>" style="width: 100%;">
		</p>
		<p>
			Chất liệu:<br>
			<input type="text" name="txtTieuDe" value="<?php echo $row["chat_lieu"];?>" style="width: 100%;">
		</p>
		<p>
			Giá cũ:<br>
			<input type="text" name="txtgiacu" value="<?php echo $row["gia_cu"];?>" style="width: 100%;">
		</p>
		<p>
			Giá mới:<br>
			<input type="text" name="txtgiamoi" value="<?php echo $row["gia_moi"];?>" style="width: 100%;">
		</p>
		<p>
			Ảnh minh họa:<br>
			<input type="file" name="txtAnhMinhHoa" style="width: 50%;">
		</p>
		<p>
			<img src="../img/<?php 
				if ($row["anh_minh_hoa"]<>"") {
					echo $row["anh_minh_hoa"];
				} else {
					echo "no_image.png";
				}
			;?>" width="180px" height="auto">
		</p>
		<p>
			Nội dung:<br>
			<textarea name="txtNoiDung" style="width: 100%;"><?php echo $row["noi_dung"];?></textarea>
		</p>
		<button type="submit">Cập nhật</button>
		<input type="hidden" name="txtID" value="<?php echo $row["id_san_pham"];?>">
	</form>
</body>
</html>