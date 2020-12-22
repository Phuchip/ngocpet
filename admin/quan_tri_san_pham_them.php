<?php
include 'header.php';
?>

<h1 style="text-align: center; padding-bottom: 20px;">THÊM MỚI SẢN PHẨM</h1>
<div> <a href="menu.html"><img src="../img/contact.gif" width="900" height="200" alt=""></a> </div>
					<h4>Thêm </h4>
	<form method="POST" action="./quan_tri_san_pham_them_thuc_hien.php" enctype="multipart/form-data">
		<p>
			Tên sản phẩm:<br>
			<input type="text" name="txtTensanpham" style="width: 100%;">
		</p>
		<p>
			Chất liệu:<br>
			<input type="text" name="txtTieuDe" style="width: 100%;">
		</p>
		<p>
			Giá cũ:<br>
			<textarea name="txtgiacu" style="width: 100%;"></textarea>
		</p>
		<p>
			Giá mới:<br>
			<textarea name="txtgiamoi" style="width: 100%;"></textarea>
		</p>
		<p>
			Ảnh minh họa:<br>
			<input type="file" name="txtAnhMinhHoa" style="width: 100%;">
		</p>
		<p>
			Nội dung:<br>
			<textarea name="txtNoiDung" style="width: 100%;"></textarea>
			<script>CKEDITOR.replace('txtNoiDung');</script>
		</p>
		<button type="submit">Thêm mới</button>
	</form>
	<?php
include './footer.php';
?>