<?php
include 'header.php';

 ?>
<h1 style="text-align: center; color: red; font=font-weight: bold; padding-bottom: 30px;">QUẢN TRỊ ĐƠN HÀNG</h1>
 <style type="text/css">
        table, th, td{
    border:1px solid #868585;
}
table{
    border-collapse:collapse;
}
table tr:nth-child(odd){
    background-color:#eee;
}
table tr:nth-child(even){
    background-color:white;
}
table tr:nth-child(1){
    background-color:skyblue;
}
    </style>
<table>

		<tr>
			<td style="font-weight: bold; ">STT</td>
			<td style="font-weight: bold; ">Người nhận</td>
			<td style="font-weight: bold; ">Địa chỉ</td>
			<td style="font-weight: bold; ">Số điện thoại</td>
			<td style="font-weight: bold; ">Ghi chú</td>
			<td style="font-weight: bold; " colspan="2">Thao tác</td>
			
			
		</tr>
		<?php 
			// 1. Chuỗi kết nối đến CSDL
			$ket_noi = mysqli_connect("localhost", "root", "", "hoen");

			// 2. Viết câu lệnh SQL để lấy ra dữ liệu mong muốn
			$sql = "
				SELECT *
				FROM tbl_hoen
				ORDER BY id DESC
			";

			// 3. Thực hiện truy vấn để lấy ra các dữ liệu mong muốn
			$id = mysqli_query($ket_noi, $sql);

			// 4. Hiển thị dữ liệu mong muốn
			$i=0;
			while ($row = mysqli_fetch_array($id)) {
			$i++;
		;?>
		<tr>
		<td ><?=$i;?></td>
		<td ><?php echo $row["name"];?></td>
		<td><?php echo $row["address"];?></td>
		<td><?php echo $row["phone"];?></td>
		<td><?php echo $row["note"];?></td>
		<td><a href="./ct_xoa.php?id=<?php echo $row["id"];?>">Xóa</a></td>
		</tr>
		
		<?php
			}
		;?>
		</table>

 <?php


include './footer.php';
?>