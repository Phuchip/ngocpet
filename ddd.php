<?php 
	// 1. Chuỗi kết nối đến CSDL
	$ket_noi = mysqli_connect("localhost", "root", "", "thuong");

	// 2. Lấy ra lấy dữ liệu thu được từ FORM chuyển sang
	$name = $_POST["name"];
	$address = $_POST["address"];
	$phone = $_POST["phone"];
	$note= $_POST["note"];

	//  Lấy ra thông tin ảnh minh họa
	
	// echo $tieu_de; exit();

	// 3. Viết câu lệnh SQL để thêm mới tin tức vào CSDL
	$sql = "
		INSERT INTO `tbl_hoen` (`id`,  `name`, `address`,  `phone`, `note`) 
		VALUES (NULL,  '".$name."', '".$address."', '".$phone."', '".$note."'); 
	";
	// echo $sql; exit();

	// 4. Thực hiện truy vấn để thêm mới tức trên
	mysqli_query($ket_noi, $sql);

	// 5. Thông báo việc thêm mới tin tức thành công & quay trở lại trang quản lý tin tức
		// Thông báo cho người dùng biết bài viết đã được thêm mới thành công
		echo 
		"
			<script type='text/javascript'>
				window.alert('Bạn đã đặt hàng thành công.');
			</script>
		";
		echo 
		"
			<script type='text/javascript'>
				window.location.href = './index.php'
			</script>
		";
;?>
