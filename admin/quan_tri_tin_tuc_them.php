<?php
include 'header.php';
?>

<h1 style="text-align: center; padding-bottom: 20px;">THÊM MỚI TIN TỨC</h1>
<div> <a href="menu.html"><img src="../img/contact.gif" width="900" height="200" alt=""></a> </div>
					<h4>Thêm tin tức</h4>
	<form method="POST" action="./quan_tri_tin_tuc_them_thuc_hien.php" enctype="multipart/form-data">
		<p>
			Tiêu đề:<br>
			<input type="text" name="txtTieuDe" style="width: 100%;">
		</p>
		<p>
			Mô tả:<br>
			<textarea name="txtMoTa" style="width: 100%;"></textarea>
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