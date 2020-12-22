<?php 
	// 1. Chuỗi kết nối đến CSDL
	$ket_noi = mysqli_connect("localhost", "root", "", "fyrhp");

	// 2. Lấy ra lấy dữ liệu thu được từ FORM chuyển sang
	$name = $_POST["your_name"];
	$email = $_POST["your_email"];
	$phone = $_POST["your_phone"];
	$comments= $_POST["comments"];

	//  Lấy ra thông tin ảnh minh họa
	
	// echo $tieu_de; exit();

	// 3. Viết câu lệnh SQL để thêm mới tin tức vào CSDL
	$sql = "
		INSERT INTO `contact_form_info` (`id`,  `name`, `email`,  `phone`, `comments`) 
		VALUES (NULL,  '".$name."', '".$email."', '".$phone."', '".$comments."'); 
	";
	// echo $sql; exit();

	// 4. Thực hiện truy vấn để thêm mới tức trên
	mysqli_query($ket_noi, $sql);

	// 5. Thông báo việc thêm mới tin tức thành công & quay trở lại trang quản lý tin tức
		// Thông báo cho người dùng biết bài viết đã được thêm mới thành công
		echo 
		"
			<script type='text/javascript'>
				window.alert('Bạn đã thêm liên hệ  thành công.');
			</script>
		";
		echo 
		"
			<script type='text/javascript'>
				window.location.href = './Lienhe.php'
			</script>
		";
;?>
