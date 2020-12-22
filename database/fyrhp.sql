-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 13, 2020 lúc 10:56 AM
-- Phiên bản máy phục vụ: 10.4.13-MariaDB
-- Phiên bản PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fyrhp`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_form_info`
--

CREATE TABLE `contact_form_info` (
  `id` int(20) NOT NULL,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact_form_info`
--

INSERT INTO `contact_form_info` (`id`, `name`, `email`, `phone`, `comments`) VALUES
(16, 'Vũ Thị Thương', 'Thuongkute@gmail.com', '0584466343', '\r\nĐiều gì đã khiến anh không cầm tay em nữa\r\nCó phải mình thật sự không xứng đôi?\r\nVài người vội vã cho em là người may mắn\r\nẤy thế mà... giờ anh đổi thay\r\n'),
(17, 'Vũ Thị Thương', 'Thuongcho@gmail.com', '0584466343', 'Còn điều gì ngu ngốc bằng: lừa dối quá nhiều \r\nvẫn nghĩ mình yêu đúng người, càng nhắm mắt yêu!\r\nNhững xao xuyến khi chạm tay, \r\nnhững háo hức tim thổn thức\r\nmôi hôn tìm nhau mỗi tối\r\n'),
(18, 'Vũ Thị Thương', 'Thuongcho@gmail.com', '09876545566', 'Tình đã qua lâu nhưng ta cứ sống trong quá khứ \r\nchứ có quên được đâu...\r\nChuyện buồn đôi ta đã hết sao chẳng thể hết tàn tạ?\r\nChỉ vì cố quên một người\r\nmà dằn vặt đến nỗi thân tâm không ngừng héo úa...'),
(19, 'Vũ Thị Thương', 'Quanghuybk14@gmail.com', '0584466343', 'Cô ta biết rằng người yêu là em chứ\r\nHà ha há hà ha há\r\nAnh chưa từng lo lắng cho 1 ai khác như vậy\r\nNhưng bây giờ anh bỏ mặc em để quan tâm cô ấy'),
(20, 'Ngô Văn Hùng', 'Hungdeptrai@gmail.com', '09363337373', 'Anh ơi mèo giá bao nhiêu ?'),
(21, 'Nguyễn Quang Huy', 'Quanghuybk14@gmail.com', '0584466343', 'Dù biết chẳng có cơ hội\r\nĐiều gì nhẫn tâm hơn sự im lặng?\r\nMuộn phiền người trút lên đôi vai này\r\nRồi ngày mai còn cần anh không?\r\nMột vòng tròn tối tăm không ra lối\r\nĐó là những gì mà anh\r\nPhải kìm nén tất cả đau đớn, tủi thân\r\nĐể bên em'),
(22, 'Nguyễn Quang Huy', 'Quanghuybk14@gmail.com', '0584466343', 'Để bên em\r\nLàm gì để ngần ấy vết dao khép lại\r\nĐể giấu đi bao nỗi đau trĩu nặng\r\nSợ ngày nào nếu tim vỡ trăm mảnh\r\nChỉ còn lại vài nhịp mong manh\r\nChuyện tình về trái tim sắp gục ngã\r\nBên hai trái tim hạnh phúc\r\nHọa thành bức tranh về tình yêu\r\nTrong đó mờ tên anh\r\nCuộc gọi đến, và như mọi khi\r\nLà lặng nghe em khóc'),
(23, 'Nguyễn Quang Huy', 'Quanghuybk14@gmail.com', '0584466343', 'ngoi ay co phai nguoi quan trong'),
(24, 'Nguyễn Du', 'Duxl@gmail.com', '0933738933', 'Cô ta đối với anh thế nào em đâu biết\r\n\r\nMà cuộc sống của anh thay đổi từ khi cô ta xuất hiện\r\n\r\nCô ta biết rằng bên anh đã có em chưa\r\n\r\n \r\n\r\nCô ta biết rằng người yêu anh là em chứ\r\n\r\nAnh chưa từng lo lắng cho một ai khác như vậy\r\n\r\nNhưng bây giờ anh bỏ mặt em để quan tâm cô ấy'),
(25, 'Nguyễn Quang Huy', 'quanghuy@gmail.com', '09876353422', 'Hôm nay anh vấp ngã chỉ biết nhìn xa xăm\r\n'),
(26, 'Bùi Văn Phúc', 'Phuchip@gmail.com', '0584466987', 'Điềm Mật Mật, Nguyên Chấn Hiệp, Đoạ lạc thiên sứ, Thành thị điệp nhân, Đô thị thuỷ tinh, Thành phố tình yêu...'),
(27, 'Trần Văn Khánh', 'Khanhtata@gmail.com', '0378928938', 'Còn con c j nữa đâu ma khóc vs sầu');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `contact_form_info`
--
ALTER TABLE `contact_form_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `contact_form_info`
--
ALTER TABLE `contact_form_info`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
