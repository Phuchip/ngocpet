<?php 
	// 1. Chuỗi kết nối đến CSDL
	$ket_noi = mysqli_connect("localhost", "root", "", "ngocpet");
            mysqli_set_charset($ket_noi, 'UTF8');
            if (mysqli_connect_errno()) 
            {
            echo 'Failed to connect to Mysql : '.$mysqli_connect_errno();
            }

	// 2. Lấy ra lấy dữ liệu thu được từ FORM chuyển sang
    $id_san_pham = $_POST["txtID"];
	$ten_san_pham = $_POST["txtTensanpham"];
	$chat_lieu = $_POST["txtTieuDe"];
	$Gia_cu = $_POST["txtgiacu"];
	$Gia_moi = $_POST["txtgiamoi"];
	$noi_dung = $_POST["txtNoiDung"];

	//  Lấy ra thông tin ảnh minh họa
	$anh_minh_hoa = "../img/".basename($_FILES["txtAnhMinhHoa"]["name"]);
	$file_anh_tam = $_FILES['txtAnhMinhHoa']["tmp_name"];
	$result = move_uploaded_file($file_anh_tam, $anh_minh_hoa);
	if(!$result) {
		$anh_minh_hoa = NULL;
	}

	// 3. Viết câu lệnh SQL để thêm mới tin tức vào CSDL
	if($anh_minh_hoa == NULL) {
		$sql = "
			UPDATE `tbl_san_pham` 
			SET
				`ten_san_pham` = '".$ten_san_pham."',
				`chat_lieu` = '".$chat_lieu."',
				`gia_cu` = '".$Gia_cu."',
				`gia_moi` = '".$Gia_moi."',
				`noi_dung` = '".$noi_dung."'
			WHERE `id_san_pham` = '".$id_san_pham."'
		";
	} else {
		$sql = "
			UPDATE `tbl_san_pham` 
			SET
				`ten_san_pham` = '".$ten_san_pham."',
				`chat_lieu` = '".$chat_lieu."',
				`gia_cu` = '".$Gia_cu."',
				`gia_moi` = '".$Gia_moi."',
				`anh_minh_hoa` = '".$anh_minh_hoa."',
				`noi_dung` = '".$noi_dung."'				
			WHERE `id_san_pham` = '".$id_san_pham."'
		";
	}
	// echo $sql; exit();

	// 4. Thực hiện truy vấn để thêm mới tức trên
	mysqli_query($ket_noi, $sql);

	// 5. Thông báo việc thêm mới tin tức thành công & quay trở lại trang quản lý tin tức
		// Thông báo cho người dùng biết bài viết đã được thêm mới thành công
		echo 
		"
			<script type='text/javascript'>
				window.alert('Bạn đã cập nhật bài viết thành công.');
			</script>
		";

		// Chuyển người dùng vào trang quản trị tin tức
		echo 
		"
			<script type='text/javascript'>
				window.location.href = './product_listing.php'
			</script>
		";
;?>