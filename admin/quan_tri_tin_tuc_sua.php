<!DOCTYPE html>
<html>
<head>
	<title>Sửa tin tức</title>
</head>
<body>
	<h1 style="text-align: center; padding-bottom: 20px;">SỬA TIN TỨC</h1>
	<form method="POST" action="./quan_tri_tin_tuc_sua_thuc_hien.php" enctype="multipart/form-data">
	<?php 
		// 1. Chuỗi kết nối đến CSDL
		$ket_noi = mysqli_connect("localhost", "root", "", "ngocpet");
            mysqli_set_charset($ket_noi, 'UTF8');
            if (mysqli_connect_errno()) 
            {
            echo 'Failed to connect to Mysql : '.$mysqli_connect_errno();
            }

		// 2. Lấy ra được ID của tin tức cần xóa
		$id_tin_tuc=$_GET["id"];
		// echo $id_tin_tuc; exit();

		// 2. Viết câu lệnh SQL để lấy ra tin tức có id thu được như trên
		$sql = "
			SELECT *
			FROM tbl_tin_tuc
			WHERE id_tin_tuc='".$id_tin_tuc."'
		";

		// 4. Thực hiện truy vấn để xóa tin tức trên
		$tin_tuc = mysqli_query($ket_noi, $sql);

		// 5. Hiển thị dữ liệu lên trang Web
		$row = mysqli_fetch_array($tin_tuc);
	;?>
		<p>
			Tiêu đề:<br>
			<input type="text" name="txtTieuDe" value="<?php echo $row["tieu_de"];?>" style="width: 100%;">
		</p>
		<p>
			Mô tả:<br>
			<textarea name="txtMoTa" style="width: 100%;"><?php echo $row["mo_ta"];?></textarea>
		</p>
		<p>
			Loại tin tức:<br>
			<textarea name="txtLoaiTinTuc" style="width: 300px ;height:30px"><?php echo $row["id_loai_tin_tuc"];?></textarea>
			<span>
				<ul>
					<li>1. Tin Khuyến Mãi</li>
					<li>2. Tin sự kiện</li>
					<li>3. Thông tin hữu ích cho Thú Cưng</li>
					<li>4. Dịch Vụ Pet</li>
					<li>5. Thông tin hữu ích cho Mèo</li>
					<li>6. Thông tin hữu ích cho Chó</li>
				</ul>
			</span>
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
		<input type="hidden" name="txtID" value="<?php echo $row["id_tin_tuc"];?>">
	</form>
</body>
</html>