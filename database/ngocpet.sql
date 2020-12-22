-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 14, 2020 lúc 12:12 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ngocpet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image_library`
--

CREATE TABLE `image_library` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `link`, `position`, `created_time`, `last_updated`) VALUES
(4, 0, 'Level 1', 'home2.php', 0, 1555232698, 1555232698),
(5, 4, 'Level 2', 'product.php', 1, 1555232976, 1555232976),
(6, 5, 'Level 3', 'product.php', 0, 1555232976, 1555232976),
(7, 6, 'Level 4', 'home.php', 0, 1555232976, 1555232976),
(8, 4, 'Level 2.2', 'product.php', 2, 1555232976, 1555232976),
(9, 8, 'Level 3.2', 'product.php', 1, 1555427808, 1555427808),
(10, 7, 'Level 5', 'home.php', 0, 1555427808, 1555427808),
(21, 16, 'Level 2.2.2', 'home2.php', 1, 1555232698, 1555232698),
(17, 10, 'Level 6', '#', 1, 1555542591, 1555542591),
(16, 0, 'Level 1.2', 'home2.php', 1, 1555232698, 1555232698);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `note` text NOT NULL,
  `total` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `name`, `phone`, `address`, `note`, `total`, `created_time`, `last_updated`) VALUES
(29, 'Andn', '0654654615', 'Ha Noi', 'Ghi chu', 8290000, 1587872426, 1587872426),
(30, 'Nguyễn Quang Huy', '0584466343', 'Xóm tân thái,xã hóa thượng ,huyện đồng hỷ', 'huyy', 3240000, 1593426569, 1593426569),
(31, 'Nguyễn Quang Huy', '0584466343', 'Xóm tân thái,xã hóa thượng ,huyện đồng hỷ', '', 2160000, 1594623624, 1594623624),
(32, 'tvk', '9888888', 'dffđf', 'ffff', 5657000, 1594630313, 1594630313);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_time`, `last_updated`) VALUES
(19, 29, 2, 1, 540000, 1587872426, 1587872426),
(22, 30, 2, 6, 540000, 1593426569, 1593426569),
(31, 31, 2, 4, 540000, 1594623624, 1594623624),
(32, 32, 14, 1, 657000, 1594630313, 1594630313),
(33, 32, 21, 1, 5000000, 1594630313, 1594630313);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `content` text NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `content`, `created_time`, `last_updated`) VALUES
(2, 'Đệm cho thú cưng', 'uploads/02-07-2020/t7.jpg', 540000, '', 1552615987, 1593662512),
(14, 'Nhà xanh', 'uploads/02-07-2020/q4.jpg', 657000, '', 1552615987, 1593662463),
(18, 'Lồng vận chuyển', 'uploads/02-07-2020/q2.jpg', 500000, '', 1552615987, 1593662440),
(21, 'Vũ Thị Thương', 'uploads/29-06-2020/a6.jpg', 5000000, 'huyy', 1593439716, 1593490800);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_loai_san_pham`
--

CREATE TABLE `tbl_loai_san_pham` (
  `id_loai_san_pham` int(11) NOT NULL,
  `ten_loai_san_pham` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghi_chu` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_loai_san_pham`
--

INSERT INTO `tbl_loai_san_pham` (`id_loai_san_pham`, `ten_loai_san_pham`, `ghi_chu`) VALUES
(1, 'Sản phẩm nổi bật', NULL),
(2, 'Shop cún cưng', NULL),
(3, 'Shop mèo cưng', NULL),
(4, 'Sản phẩm bán chạy', NULL),
(5, 'Shop vật nuôi khác', NULL),
(6, 'Phụ kiện', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_loai_tin_tuc`
--

CREATE TABLE `tbl_loai_tin_tuc` (
  `id_loai_tin_tuc` int(11) NOT NULL,
  `ten_loai_tin_tuc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_loai_tin_tuc`
--

INSERT INTO `tbl_loai_tin_tuc` (`id_loai_tin_tuc`, `ten_loai_tin_tuc`, `ghi_chu`) VALUES
(1, 'Tin Khuyến Mãi', NULL),
(2, 'Tin sự kiện', NULL),
(3, 'Thông tin hữu ích cho Thú Cưng', NULL),
(4, 'Dịch Vụ Pet', NULL),
(5, 'Thông tin hữu ích cho Mèo', NULL),
(6, 'Thông tin hữu ích cho Chó', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_san_pham`
--

CREATE TABLE `tbl_san_pham` (
  `id_san_pham` int(11) NOT NULL,
  `id_loai_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_lieu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anh_minh_hoa` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_cu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_moi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ghi_chu` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_san_pham`
--

INSERT INTO `tbl_san_pham` (`id_san_pham`, `id_loai_san_pham`, `ten_san_pham`, `chat_lieu`, `anh_minh_hoa`, `gia_cu`, `gia_moi`, `noi_dung`, `ghi_chu`) VALUES
(1, 6, 'Bàn chải', 'Nhựa', '../images/Bàn Chải Làm Sạch Lông.jpg', '150.000', '130.000', 'Bàn Chải Làm Sạch Lông- Bộ Dụng Cụ Làm Sạch Lông Dính Ở Mọi Nơi\r\nKhi nuôi thú cưng, có rất nhiều người e ngại vì khả năng rụng lông của chúng cũng như cách vệ sinh lông của thú cưng ra sao. Những chiếc lông vướng trên ghế sofa, quần áo, thảm trải nhà,…sẽ rất khó để làm sạch dù bạn có giặt chúng. Với công dụng siêu tuyệt vời của chiếc bàn chải lông- dụng cụ làm sạch lông dính ở mọi nơi dành cho thú cưng sẽ giúp bạn làm điều đó. Bàn chải làm sạch lông này sẽ làm sạch tất cả những nơi dính lông của thú cưng và lấy lại sự sạch đẹp nhất. Nhất định bạn nên sắm chiếc bàn chải lông này về nhà để an tâm nuôi thú cưng. Không còn lo lắng về việc dọn dẹp những chiếc lông dính trên mọi nơi trong nhà nhé!\r\n\r\nLược Xù\r\nGăng Tay Chải Lông\r\nGăng Tay Chải Lông\r\nKhăn Tắm Siêu Thấm\r\nKhay Vệ Sinh Cho Chó\r\n\r\nChiếc bàn chải với công dụng làm sạch lông siêu tốt', ''),
(2, 6, 'Cặp Nơ', 'Nhựa', '../images/cặp nơ.jpg', '20.000', '15.000', 'Cặp Nơ Siêu Xinh Giúp Thú Cưng Nhà Bạn Trở Nên Xinh Xắn\r\nVới những chú chó và chú mèo có bộ lông dài và dày cần làm gì để chúng trở nên xinh đẹp hơn? Những món đồ trang trí siêu xinh đẹp như những chiếc nơ xinh xắn sẽ giúp thú cưng trở nên xinh xắn hơn. Cặp nơ giúp phần lông đầu của chúng được cặp gọn gàng và trở nên xinh xắn hơn. Cùng chúng tôi tham khảo món đồ xinh đẹp này nhé!\r\n\r\nNhà Chống Hôi Cho Thú Cưng\r\nQuần Áo Xuân Hè\r\nÁo Mùa Thu\r\nQuần Áo Hình Sao (4 chân)\r\nÁo Hình Xương Cá\r\n<br>\r\nCông dụng của sản phẩm\r\nChiếc cặp nơ sẽ giúp thú cưng nhà bạn trở nên xinh đẹp hơn bao giờ hết. Những phần lông dài trên phần đầu của chúng. Những phần lông mọc không được mượt mà cần được làm gọn gàng. Tất cả sẽ được chiếc cặp siêu xinh này làm gọn gàng lại mà vẫn trở nên xinh xắn. Chiếc cặp mang lại vẻ đẹp hồn nhiên cho thú cưng. Mang lại sự xinh đẹp một cách tự nhiên. Giúp bộ lông của chúng trở nên gọn gàng nhưng vẫn giữ được nét quyến rũ.\r\n<br>\r\nChi tiết về chiếc cặp\r\nChiếc cặp tóc được thiết kế rất đẹp mắt và sáng tạo. Nhỏ nhắn nhưng lại có thể cặp gọn gàng phần lông trên đầu của thú cưng. Phần cặp được làm bằng chất liệu kim loại bọc nhựa. Điều này giúp mang lại sự thoải mái và êm ái khi cặp lên đầu thú cưng. Khi đeo chiếc cjăp nơ thú cưng sẽ cảm thấy thích thú chứ không có cảm giác khó chịu.', ''),
(3, 6, 'Bát ăn + Bình nước', 'Nhựa', '../images/Bát ăn+bình nước.jpg', '70.000', '60.000', 'Bát Ăn Và Bình Nước Sự Kết Hợp Siêu Tiện Lợi Dành Cho Thú Cưng\r\nSắm sửa những dụng cụ cần thiết cho thú cưng nhà bạn để chúng có không gian sống tuyệt vời nhất. Một chiếc bát ăn kết hợp tinh tế cùng bình nước sẽ nhắc nhở chúng uống nước sau mỗi bữa ăn đầy đủ. Sản phẩm được chúng tôi giới thiệu tiếp sau đây sẽ giúp bạn chăm sóc thú cưng nhà mình đơn giản và dễ dàng hơn. Hãy cùng theo dõi sản phẩm bát ăn và bình nước này ngay nhé!\r\n<br>\r\nBát Inox Gắn Chuồng\r\n<br>\r\nBát Ăn Đơn\r\n<br>\r\nBát Ăn Đôi\r\n<br>\r\nBát Ăn Gắn Chuồng\r\n<br>\r\nBình Nước Gắn Chuồng', ''),
(4, 6, 'Dụng cụ tỉa lông+ cắt móng', 'Sắt', '../images/dụng cụ tỉa lông+ cắt móng.jpg', '160.000', '140.000', 'Combo Dụng Cụ Cắt Tỉa Lông Và Cắt Móng Dành Cho Thú Cưng\r\n<br>\r\nChăm sóc cẩn thận cho thú cưng nhà bạn bằng việc cắt tỉa lông, cắt móng là điều vô cùng cần thiết. Chính vì thế, sắm một bộ dụng cụ cắt tỉa lông và cắt móng cho thú cưng là việc cũng rất đúng đắn. Bộ sản phẩm được chúng tôi giới thiệu ngay sau đây bao gồm cả dụng cụ cắt tỉa lông và cả dụng cụ cắt móng cho thú cưng. Hai vật phẩm quan trọng và cần thiết cho thú cưng trong cùng một bộ sản phẩm. Vừa đầy đủ lại vừa có giá thành tốt, chần chừ gì mà không sắm ngay thôi!\r\n<br>\r\nCông dụng của sản phẩm\r\n<br>\r\nBộ cắt tỉa lông dành cho thú cưng sẽ giúp bạn tỉa gọn nhẹ những chiếc lông quá dài cho thú cưng. Chiếc lược đi kèm cùng sản phẩm sẽ giúp bạn cắt được lượng lông vừa phải theo ý của mình. Cắt tỉa lông được thực hiện với những chú thú cưng có bộ lông quá dày và dài. Để chúng không bị ngột ngạt vào mùa nóng tại nước ta. Bạn nên chú ý đến việc tỉa lông cho chúng để tránh sốc nhiệt. Hoặc bạn có thể tạo kiểu theo ý mình với bộ lông của chúng. Không còn phải ra các địa chỉ chăm sóc thú cưng như trước. Với chi phí rẻ này bạn có thể tự chăm sóc cho thú cưng nhà mình.', ''),
(5, 6, 'Rào Quây Chó', 'sắt', '../images/Rào quây chó.jpg', '600.000', '500.000', 'Rào Quây Chó Vô Cùng Tiện Lợi Dành Cho Mọi Thú Cưng\r\n<br>\r\nBạn đang tìm kiếm một vật dụng có thể nhốt thú cưng vào những dịp cần thiết. Bạn lo lắng khi phải mua những chiếc lồng quá to lớn để nhốt thú cưng. Ngôi nhà không có quá nhiều chỗ trống để nhốt cố định thú cưng lại theo ý muốn? Rất nhiều nỗi lo lắng của người nuôi thú cưng khi muốn tìm không gian riêng cho cả chú thú cưng và cả mình. Để hạn chế được những nhược điểm của chiếc lồng nhốt thú cưng cố định. Thì giờ đây đã có sự ra đời của những chiếc rào quây chó với công dụng siêu tiện lợi. Hãy cùng tìm hiểu ngay nhé!\r\n<br>\r\n<strong>\r\nCông dụng của sản phẩm </strong>\r\n<br>\r\nRào quây chó được ví như một chiếc lồng mini linh hoạt dành cho những chú chó. Chiếc rào quây chó rất thích hợp với những gia đình nuôi thú cưng nhưng lại không có quá nhiều diện tích. Với những gia đình có điều kiện và rộng rãi hơn họ có thể sắm cho thú cưng những chiếc lồng và đặt tại nhà. Thú cưng cũng rất cần có những không gian riêng để thoải thích theo ý của mình hoặc hơn hết là nghỉ ngơi.', ''),
(6, 6, 'Dây thắt chó lớn', 'Vải', '../images/dây thắt chó lớn.jpg', '150.000', '140.000', '<strong>Dây Dắt Chó Lớn Dành Cho Cún Cưng Mỗi Khi Đi Dạo</strong>\r\n<br>\r\nBạn đang tìm một dụng cụ giúp bạn trông giữ và quản lý chú chó nhà mình mỗi khi đi ra ngoài. Bạn muốn tìm một vật phẩm mà không bao giờ làm chú chó nhà mình bị lạc khỏi bạn mỗi khi đi chơi. Chúng tôi xin giới thiệu đến bạn chiếc dây dắt tiện lợi. Một vật phẩm gắn liền trong mỗi cuộc đi dạo của Cún cưng. Nếu có chiếc dây dắt, bạn sẽ an tâm hơn về chú chó của mình. Quản lý được những bước đi của chúng, không để lạc chúng và quan trọng là bạn sẽ bên chúng mọi lúc mọi nơi. Hãy cùng chúng tôi tham khảo mẫu sản phẩm dây dắt chó lớn này ngay nhé!\r\n<strong>Công dụng của sản phẩm:</strong>\r\nChiếc dây dắt chính là dụng cụ mà rất nhiều người nuôi thú cưng rất ưa chuộng. Mỗi khi đưa chú chó nhà mình ra ngoài, chủ nhân của chúng sẽ rất khó kiểm soát chúng. Bản tính là một loài thú, chúng ham chơi và thường tò mò về vạn vật xung quanh mình. Thấy cái gì bí ẩn hay thú vị chúng sẽ chạy đến và tìm kiếm. Chúng quên mất đi chủ nhân đang đi cùng mình và quên mất mình phải đi về đâu. Chính vì thế mà dẫn đến bị lạc mất phương hướng, lạc chủ nhân của mình. Rất nhiều trường hợp đã bị lạc chú thú cưng của mình khi mang chúng ra ngoài đi dạo.', ''),
(7, 6, 'Đệm cho chó', 'Vải', '../images/đệm cho chó.jpg', '310.000', '290.000', '<strong>Chiếc Đệm Êm Ái Mang Lại Giấc Ngủ Tuyệt Vời Cho Những Cún Cưng</strong>\r\n<br>\r\nNhững giấc ngủ ngon của Cún cưng nhà bạn chính là liều thuốc tuyệt vời để chúng có một sức khỏe tốt. Chính vì vậy, sắm sửa cho Cún cưng những chiếc đệm êm ái để chúng có thể thoải mái ngủ là điều vô cùng cần thiết. Một nơi ngủ mang lại sự ấm áp, mang lại cảm giác thoải mái. Giúp những giấc ngủ trở nên sâu và ngon hơn thì nhất thiết chúng phải có được một nơi ngủ tuyệt vời. Giới thiệu đến bạn chiếc Đệm êm ái dành cho Cún cưng mà bạn cần mua ngay. Để mang lại những giấc ngủ tuyệt vời cho Cún cưng nhà mình.<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nChiếc đệm này có công dụng giúp thú cưng nhà bạn có một nơi ngủ êm ấm. Dù là mùa đông hay mùa hè chúng cũng cần có một nơi để nằm nghỉ. Sau những cuộc dạo chơi trong ngày dài mất sức. Thú cưng nhà bạn cần một nơi để ngủ thoải mái nhất, không có sự bất tiện nào có thể cản trở giấc ngủ của chúng. Chiếc đệm dành cho thú cưng này sẽ giúp thú cưng nhà bạn có những giấc ngủ sâu và ngon hơn. Giúp thú cưng lấy lại được nguồn năng lượng mới để phục vụ cho ngày dài tiếp theo.', ''),
(8, 6, 'Đĩa ném', 'Nhựa', '../images/đĩa ném.jpg', '25.000', '20.000', '<strong>Chiếc Đĩa Ném Dành Cho Thú Cưng Trong Những Buổi Tập Luyện</strong>\r\n<br>\r\nThêm một vật phẩm mà bạn cần có trong những buổi huấn luyện thú cưng. Một chiếc đĩa ném giúp thú cưng có sự hứng thú trong những buổi tập. Bạn có thể hướng dẫn thú cưng tập bắt đồ vật bằng những chiếc đĩa ném màu sắc này. Thay vì dắt thú cưng đi dạo, bạn nên có nhiều bài tập cơ bản hơn để giúp thú cưng cảm thấy thu hút khi tập luyện. Sản phẩm chiếc đĩa ném được chúng tôi giới thiệu tiếp đây sẽ là sản phẩm mà bạn cần tham khảo để sắm ngay cho các em thú cưng. Tạo cảm hứng khi tập luyện, lại mang lại sự thích thú. Thú cưng nhà bạn sẽ có những buổi tập luyện đạt hiệu quả cao hơn.\r\n<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nChiếc đĩa ném là một sản phẩm được sử dụng thường xuyên trong các buổi huấn luyện thú cưng. Thay vì những bài tập đơn giản như chạy bộ, chạy bền hay bơi lội bạn nên tạo cảm hứng cho chúng bằng những bài tập cơ bản khác. Dùng một chiếc đĩa có màu sắc thu hút để ném ra xa và cho chúng chạy đi tìm. Đây là một cách tập luyện rèn luyện được cả sự nhanh nhạy và khả năng chạy nhanh của thú cưng.', ''),
(9, 3, 'Mèo Munchkin chân ngắn Tuxedo – Misty', '', '../images/meo.jpg', '', '', 'Tên: Misty\r\nGiống: mèo Munchkin chân ngắn.\r\nMàu sắc: Tuxedo\r\nGiới tính: cái\r\nTuổi: 4 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\nGiấy Tica, Wcf: không\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(10, 4, 'Bàn chải', '', '../images/Bàn Chải Làm Sạch Lông.jpg', '150.000', '130.000', '<strong>Bàn Chải Làm Sạch Lông- Bộ Dụng Cụ Làm Sạch Lông Dính Ở Mọi Nơi</strong>\r\n<br>\r\nKhi nuôi thú cưng, có rất nhiều người e ngại vì khả năng rụng lông của chúng cũng như cách vệ sinh lông của thú cưng ra sao. Những chiếc lông vướng trên ghế sofa, quần áo, thảm trải nhà,…sẽ rất khó để làm sạch dù bạn có giặt chúng. Với công dụng siêu tuyệt vời của chiếc bàn chải lông- dụng cụ làm sạch lông dính ở mọi nơi dành cho thú cưng sẽ giúp bạn làm điều đó. Bàn chải làm sạch lông này sẽ làm sạch tất cả những nơi dính lông của thú cưng và lấy lại sự sạch đẹp nhất. Nhất định bạn nên sắm chiếc bàn chải lông này về nhà để an tâm nuôi thú cưng. Không còn lo lắng về việc dọn dẹp những chiếc lông dính trên mọi nơi trong nhà nhé!\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nBàn chải làm sạch lông này là bộ sản phẩm dùng để vệ sinh những chiếc lông bên ngoài thú cưng. Khi thú cưng của bạn bị rụng lông, những chiếc lông sẽ rất dễ vướng vào quần áo, ghế sofa, thảm trải nhà,…Những nơi rất khó để có thể vệ sinh dù bạn có dùng bàn chải để giặt hay máy hút bụi để hút. Chính vì thế mà chiếc bài chải này được ra đời để giúp người nuôi thú cưng giải quyết được hoàn toàn việc vệ sinh đó.', ''),
(11, 4, 'Đĩa ném', '', '../images/đĩa ném.jpg', '25.000', '20.000', '<strong>Chiếc Đĩa Ném Dành Cho Thú Cưng Trong Những Buổi Tập Luyện</strong>\r\n<br>\r\nThêm một vật phẩm mà bạn cần có trong những buổi huấn luyện thú cưng. Một chiếc đĩa ném giúp thú cưng có sự hứng thú trong những buổi tập. Bạn có thể hướng dẫn thú cưng tập bắt đồ vật bằng những chiếc đĩa ném màu sắc này. Thay vì dắt thú cưng đi dạo, bạn nên có nhiều bài tập cơ bản hơn để giúp thú cưng cảm thấy thu hút khi tập luyện. Sản phẩm chiếc đĩa ném được chúng tôi giới thiệu tiếp đây sẽ là sản phẩm mà bạn cần tham khảo để sắm ngay cho các em thú cưng. Tạo cảm hứng khi tập luyện, lại mang lại sự thích thú. Thú cưng nhà bạn sẽ có những buổi tập luyện đạt hiệu quả cao hơn.\r\n<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nChiếc đĩa ném là một sản phẩm được sử dụng thường xuyên trong các buổi huấn luyện thú cưng. Thay vì những bài tập đơn giản như chạy bộ, chạy bền hay bơi lội bạn nên tạo cảm hứng cho chúng bằng những bài tập cơ bản khác. Dùng một chiếc đĩa có màu sắc thu hút để ném ra xa và cho chúng chạy đi tìm. Đây là một cách tập luyện rèn luyện được cả sự nhanh nhạy và khả năng chạy nhanh của thú cưng.', ''),
(12, 1, 'Đệm cho chó', '', '../images/đệm cho chó.jpg', '310.000', '290.000', '<strong>Chiếc Đệm Êm Ái Mang Lại Giấc Ngủ Tuyệt Vời Cho Những Cún Cưng</strong>\r\n<br>\r\nNhững giấc ngủ ngon của Cún cưng nhà bạn chính là liều thuốc tuyệt vời để chúng có một sức khỏe tốt. Chính vì vậy, sắm sửa cho Cún cưng những chiếc đệm êm ái để chúng có thể thoải mái ngủ là điều vô cùng cần thiết. Một nơi ngủ mang lại sự ấm áp, mang lại cảm giác thoải mái. Giúp những giấc ngủ trở nên sâu và ngon hơn thì nhất thiết chúng phải có được một nơi ngủ tuyệt vời. Giới thiệu đến bạn chiếc Đệm êm ái dành cho Cún cưng mà bạn cần mua ngay. Để mang lại những giấc ngủ tuyệt vời cho Cún cưng nhà mình.<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nChiếc đệm này có công dụng giúp thú cưng nhà bạn có một nơi ngủ êm ấm. Dù là mùa đông hay mùa hè chúng cũng cần có một nơi để nằm nghỉ. Sau những cuộc dạo chơi trong ngày dài mất sức. Thú cưng nhà bạn cần một nơi để ngủ thoải mái nhất, không có sự bất tiện nào có thể cản trở giấc ngủ của chúng. Chiếc đệm dành cho thú cưng này sẽ giúp thú cưng nhà bạn có những giấc ngủ sâu và ngon hơn. Giúp thú cưng lấy lại được nguồn năng lượng mới để phục vụ cho ngày dài tiếp theo.', ''),
(13, 1, 'Rào Quây Chó', '', '../images/Rào quây chó.jpg', '600.000', '500.000', '<strong>Rào Quây Chó Vô Cùng Tiện Lợi Dành Cho Mọi Thú Cưng</strong>\r\n<br>\r\nBạn đang tìm kiếm một vật dụng có thể nhốt thú cưng vào những dịp cần thiết. Bạn lo lắng khi phải mua những chiếc lồng quá to lớn để nhốt thú cưng. Ngôi nhà không có quá nhiều chỗ trống để nhốt cố định thú cưng lại theo ý muốn? Rất nhiều nỗi lo lắng của người nuôi thú cưng khi muốn tìm không gian riêng cho cả chú thú cưng và cả mình. Để hạn chế được những nhược điểm của chiếc lồng nhốt thú cưng cố định. Thì giờ đây đã có sự ra đời của những chiếc rào quây chó với công dụng siêu tiện lợi. Hãy cùng tìm hiểu ngay nhé!\r\n<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nRào quây chó được ví như một chiếc lồng mini linh hoạt dành cho những chú chó. Chiếc rào quây chó rất thích hợp với những gia đình nuôi thú cưng nhưng lại không có quá nhiều diện tích. Với những gia đình có điều kiện và rộng rãi hơn họ có thể sắm cho thú cưng những chiếc lồng và đặt tại nhà. Thú cưng cũng rất cần có những không gian riêng để thoải thích theo ý của mình hoặc hơn hết là nghỉ ngơi.', ''),
(18, 3, 'Mèo Anh lông ngắn Lilac- Oreo', '', '../images/mèo cảnh.jpg', '', '', 'Tên: Oreo\r\n<br>\r\nGiống: mèo British Shorthair (mèo Anh lông ngắn, Aln)\r\n<br>\r\nMàu sắc: Lilac\r\n<br>\r\nGiới tính: cái\r\n<br>\r\nTuổi: 2 tháng.\r\n<br>\r\nTình trạng: có sẵn.\r\n<br>\r\nSổ sức khỏe: có\r\n<br>\r\nTiêm vacxin: 2 mũi\r\n<br>\r\nTẩy giun: lần 1.\r\n<br>\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\n<br>\r\nGiấy Tica, Wcf: không\r\n<br>\r\nBảo hành: 15-45 ngày tùy gói.\r\n<br>\r\nVận chuyển: miễn phí toàn quốc.\r\n<br>\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(19, 3, 'Mèo Anh lông ngắn màu xám xanh – Chloe', '', '../images/mèo anh lông ngắn.jpg', '', '', 'Tên: Chloe\r\nGiống: mèo British Shorthair (mèo Anh lông ngắn, Aln)\r\nMàu sắc: xám xanh (blue)\r\nGiới tính: đực\r\nTuổi: 2 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\nGiấy Tica, Wcf: không\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(20, 3, 'Mèo Anh lông dài xám xanh – Simba', '', '../images/meo-anh-long-dai-mau-xam-xanh.jpg', '', '', 'Tên: Simba\r\nGiống: mèo British Longhair (mèo Anh lông dài, Ald)\r\nMàu sắc: xám xanh (blue)\r\nGiới tính: đực\r\nTuổi: 2 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\nGiấy Tica, Wcf: không\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(21, 3, 'Mèo Ald trắng hai màu mắt - Snow White', '', '../images/mèo ald.jpg', '', '', 'Tên: Snow White\r\nGiống: mèo British Longhair (mèo Anh lông dài, Ald)\r\nMàu sắc: trắng, hai màu mắt.\r\nGiới tính: đực\r\nTuổi: 2 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\nGiấy Tica, Wcf: không\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(22, 6, 'Rào Quây Chó', 'sắt', '../images/Rào quây chó.jpg', '600.000', '500.000', 'Rào Quây Chó Vô Cùng Tiện Lợi Dành Cho Mọi Thú Cưng\r\n<br>\r\nBạn đang tìm kiếm một vật dụng có thể nhốt thú cưng vào những dịp cần thiết. Bạn lo lắng khi phải mua những chiếc lồng quá to lớn để nhốt thú cưng. Ngôi nhà không có quá nhiều chỗ trống để nhốt cố định thú cưng lại theo ý muốn? Rất nhiều nỗi lo lắng của người nuôi thú cưng khi muốn tìm không gian riêng cho cả chú thú cưng và cả mình. Để hạn chế được những nhược điểm của chiếc lồng nhốt thú cưng cố định. Thì giờ đây đã có sự ra đời của những chiếc rào quây chó với công dụng siêu tiện lợi. Hãy cùng tìm hiểu ngay nhé!\r\n<br>\r\nCông dụng của sản phẩm\r\n<br>\r\nRào quây chó được ví như một chiếc lồng mini linh hoạt dành cho những chú chó. Chiếc rào quây chó rất thích hợp với những gia đình nuôi thú cưng nhưng lại không có quá nhiều diện tích. Với những gia đình có điều kiện và rộng rãi hơn họ có thể sắm cho thú cưng những chiếc lồng và đặt tại nhà. Thú cưng cũng rất cần có những không gian riêng để thoải thích theo ý của mình hoặc hơn hết là nghỉ ngơi.', ''),
(23, 6, 'Dây thắt chó lớn', 'Vải', '../images/dây thắt chó lớn.jpg', '150.000', '140.000', '<strong>Dây Dắt Chó Lớn Dành Cho Cún Cưng Mỗi Khi Đi Dạo</strong>\r\n<br>\r\nBạn đang tìm một dụng cụ giúp bạn trông giữ và quản lý chú chó nhà mình mỗi khi đi ra ngoài. Bạn muốn tìm một vật phẩm mà không bao giờ làm chú chó nhà mình bị lạc khỏi bạn mỗi khi đi chơi. Chúng tôi xin giới thiệu đến bạn chiếc dây dắt tiện lợi. Một vật phẩm gắn liền trong mỗi cuộc đi dạo của Cún cưng. Nếu có chiếc dây dắt, bạn sẽ an tâm hơn về chú chó của mình. Quản lý được những bước đi của chúng, không để lạc chúng và quan trọng là bạn sẽ bên chúng mọi lúc mọi nơi. Hãy cùng chúng tôi tham khảo mẫu sản phẩm dây dắt chó lớn này ngay nhé!\r\n<strong>Công dụng của sản phẩm:</strong>\r\nChiếc dây dắt chính là dụng cụ mà rất nhiều người nuôi thú cưng rất ưa chuộng. Mỗi khi đưa chú chó nhà mình ra ngoài, chủ nhân của chúng sẽ rất khó kiểm soát chúng. Bản tính là một loài thú, chúng ham chơi và thường tò mò về vạn vật xung quanh mình. Thấy cái gì bí ẩn hay thú vị chúng sẽ chạy đến và tìm kiếm. Chúng quên mất đi chủ nhân đang đi cùng mình và quên mất mình phải đi về đâu. Chính vì thế mà dẫn đến bị lạc mất phương hướng, lạc chủ nhân của mình. Rất nhiều trường hợp đã bị lạc chú thú cưng của mình khi mang chúng ra ngoài đi dạo.', ''),
(24, 6, 'Đệm cho chó', 'Vải', '../images/đệm cho chó.jpg', '310.000', '290.000', '<strong>Chiếc Đệm Êm Ái Mang Lại Giấc Ngủ Tuyệt Vời Cho Những Cún Cưng</strong>\r\n<br>\r\nNhững giấc ngủ ngon của Cún cưng nhà bạn chính là liều thuốc tuyệt vời để chúng có một sức khỏe tốt. Chính vì vậy, sắm sửa cho Cún cưng những chiếc đệm êm ái để chúng có thể thoải mái ngủ là điều vô cùng cần thiết. Một nơi ngủ mang lại sự ấm áp, mang lại cảm giác thoải mái. Giúp những giấc ngủ trở nên sâu và ngon hơn thì nhất thiết chúng phải có được một nơi ngủ tuyệt vời. Giới thiệu đến bạn chiếc Đệm êm ái dành cho Cún cưng mà bạn cần mua ngay. Để mang lại những giấc ngủ tuyệt vời cho Cún cưng nhà mình.<br>\r\n<strong>Công dụng của sản phẩm</strong>\r\n<br>\r\nChiếc đệm này có công dụng giúp thú cưng nhà bạn có một nơi ngủ êm ấm. Dù là mùa đông hay mùa hè chúng cũng cần có một nơi để nằm nghỉ. Sau những cuộc dạo chơi trong ngày dài mất sức. Thú cưng nhà bạn cần một nơi để ngủ thoải mái nhất, không có sự bất tiện nào có thể cản trở giấc ngủ của chúng. Chiếc đệm dành cho thú cưng này sẽ giúp thú cưng nhà bạn có những giấc ngủ sâu và ngon hơn. Giúp thú cưng lấy lại được nguồn năng lượng mới để phục vụ cho ngày dài tiếp theo.', ''),
(26, 3, 'Mèo Anh lông dài bicolor - Cowboy', '', '../images/mèo anh lông dài.jpg', '', '', 'Tên: Cowboy\r\nGiống: mèo British Longhair (mèo Anh lông dài, Ald)\r\nMàu sắc: bicolor\r\nGiới tính: đực\r\nTuổi: 2 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: sinh tại Việt Nam.\r\nGiấy Tica, Wcf: không\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(27, 2, 'Bé Phốc Sóc Nhỏ Nhắn, Dễ Thương', '', '../images/bé phốc.jpg', '', '', 'Ngày sinh:26/04/2020\r\nNgày tiêm phòng mũi 1:10/06/2020\r\nNgày tiêm phòng mũi 2:29/06/2020\r\nTình trạng sức khỏe:Tốt\r\nGiới tính: Cái\r\nMàu sắc: Trắng', ''),
(28, 2, 'Bé Cún poodle ngực trắng râu trắng rất đặc biệt', '', '../images/cún poodle.jpg', '', '', 'Ngày sinh: 30/04/2020\r\nNgày tiêm phòng mũi 1: 13/06/2020\r\nNgày tiêm phòng mũi 2: 01/07/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Cái\r\nMàu sắc: Nâu Vàng', ''),
(29, 2, 'Bé Lạp Xưởng SoCoLa Tìm Nhà Mới ', '', '../images/bé socola.jpg', '', '', 'Ngày sinh: 03/04/2020\r\nNgày tiêm phòng mũi 1: 14/05/2020\r\nNgày tiêm phòng mũi 2: 05/06/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Đực\r\nMàu sắc: Socola', ''),
(30, 2, 'Gloden Retriever Tìm Người Yêu Thương', '', '../images/retrieve.jpg', '', '', 'Ngày sinh: 08/04/2020\r\nNgày tiêm phòng mũi 1: 25/05/2020\r\nNgày tiêm phòng mũi 2: 10/06/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Đực\r\nMàu sắc: Vàng ', ''),
(31, 2, 'Becgie Hà Lan Vẫn Khá Hiếm Trên Thị Trường Thú Cảnh ', '', '../images/becgie Hà Lan.jpg', '', '', 'Ngày sinh: 22/04/2020\r\nNgày tiêm phòng mũi 1: 02/06/2020\r\nNgày tiêm phòng mũi 2: 24/06/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Đực\r\nMàu sắc: Đen Vện Vàng', ''),
(32, 2, 'Bé Border Collie Xinh Xắn Có Nụ Cười Tỏa Nắng', '', '../images/bé bo.jpg', '', '', 'Ngày sinh: 17/04/2020\r\nNgày tiêm phòng mũi 1: 02/06/2020\r\nNgày tiêm phòng mũi 2: 24/06/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Đực\r\nMàu sắc: Vàng Trắng', ''),
(33, 2, 'Nhanh Tay Rinh Ngay Một Em Boss Đặc Biệt ', '', '../images/em boss.jpg', '', '', 'Ngày sinh: 22/04/2020\r\nNgày tiêm phòng mũi 1: 02/06/2020\r\nNgày tiêm phòng mũi 2: 24/06/2020\r\nTình trạng sức khỏe: Tốt\r\nGiới tính: Đực\r\nMàu sắc: Vàng', ''),
(35, 3, 'Mèo báo Bengal nhập khẩu – Beo', '', '../images/meo-bengal-duc-truong-thanh-3.jpg', '', '', 'Tên: Beo\r\nGiống: mèo Bengal, mèo báo\r\nMàu sắc: brown\r\nGiới tính: đực\r\nTuổi: 12 tháng.\r\nTình trạng: có sẵn.\r\nSổ sức khỏe: có\r\nTiêm vacxin: 2 mũi\r\nTẩy giun: lần 1.\r\nXuất xứ, nguồn gốc: nhập khẩu Liên bang Nga.\r\nGiấy Tica, Wcf: có\r\nBảo hành: 15-45 ngày tùy gói.\r\nVận chuyển: miễn phí toàn quốc.\r\nTặng kèm phụ kiện: voucher 1 triệu: mua đồ dùng thú cưng của Dogily Pet Mart, khám chữa bệnh tại phòng khám thú y Dogily Vet, tắm sấy, cắt tỉa tại Dogily Spa & Grooming.', ''),
(44, 1, 'Súng Bắn Thức Ăn', 'Nhựa', '../img/súng bắn thức ăn.jpg', '105.000', '90.000', '<h1>S&uacute;ng Bắn Thức Ăn &ndash; Tr&ograve; Chơi M&agrave; Th&uacute; Cưng V&ocirc; C&ugrave;ng Y&ecirc;u Th&iacute;ch</h1>\r\n\r\n<p>Bạn đang t&igrave;m kiếm một m&oacute;n đồ chơi mới tạo n&ecirc;n sự th&iacute;ch th&uacute; cho th&uacute; cưng. Bạn đang t&igrave;m kiếm những tr&ograve; chơi vui nhộn khi đưa th&uacute; cưng đi dạo hay đi cắm trại? Một m&oacute;n đồ chơi lu&ocirc;n đem lại cho th&uacute; cưng nh&agrave; bạn cảm gi&aacute;c th&iacute;ch th&uacute; m&atilde;i kh&ocirc;ng th&ocirc;i đ&oacute; ch&iacute;nh l&agrave; tr&ograve; chơi bắn thức ăn. Những m&oacute;n đồ ăn được ch v&agrave;o trong chiếc s&uacute;ng bắn đồ ăn sau đ&oacute; sẽ n&eacute;m cho th&uacute; cưng. Bạn c&oacute; thể chơi ở bất cứ đ&acirc;u khi muốn. V&agrave; chắc chắn đ&acirc;y sẽ l&agrave; tr&ograve; chơi mang lại sự h&agrave;o hứng th&iacute;ch th&uacute; l&acirc;u bền nhất d&agrave;nh hco th&uacute; cưng. Trước ti&ecirc;n, h&atilde;y tham khảo&nbsp;<strong>dụng cụ s&uacute;ng bắn thức ăn</strong>&nbsp;phục vụ tr&ograve; chơi n&agrave;y nh&eacute;!</p>\r\n', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_tin_tuc`
--

CREATE TABLE `tbl_tin_tuc` (
  `id_tin_tuc` int(11) NOT NULL,
  `id_loai_tin_tuc` int(11) NOT NULL,
  `tieu_de` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mo_ta` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `anh_minh_hoa` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noi_dung` text COLLATE utf8_unicode_ci NOT NULL,
  `ghi_chu` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_tin_tuc`
--

INSERT INTO `tbl_tin_tuc` (`id_tin_tuc`, `id_loai_tin_tuc`, `tieu_de`, `mo_ta`, `anh_minh_hoa`, `noi_dung`, `ghi_chu`) VALUES
(1, 2, 'CARE YOUR PET - Ngày Hội Chăm Sóc Sức Khỏe Toàn Diện Cho Thú Cưng', 'Năm mới đến rồi, sen hãy đưa boss đi tiêm chủng tại Ngọc Pet để chào đón 1 năm mới khỏe mạnh. Tại Ngọc Pet, thú cưng của bạn sẽ được khám chữa bệnh và tư vấn miễn phí các bệnh về da bởi đội ngũ y bác sĩ giàu kinh nghiệm, tâm huyết với nghề cùng tình yêu thương bao la dành cho động vật.', '../img/care.png', '<p>Đến với Ngọc Pet, thú cưng của bạn sẽ được khám chữa bệnh và tư vấn miễn phí các bệnh về da bởi đội ngũ y bác sĩ giàu kinh nghiệm, tâm huyết với nghề cùng tình yêu thương bao la dành cho động vật.</p>\r\n<br>\r\n<p>\r\n<strong>Chương trình sẽ được diễn ra tại</strong>: Ngọc Pet\r\n<br>\r\nĐịa chỉ: số 10-Chùa Hang-Đồng Hỷ-Thái Nguyên\r\n</p>\r\n<p>\r\nThời gian: 9h30 - 12h ngày 25/07/2020\r\n</p>\r\n<p>Đơn vị tổ chức:</p>\r\n<p>\r\nNgọc Pet – Hệ thống siêu thị cho thú cưng hàng đầu Việt Nam\r\n</P>\r\n<p><strong>Nội dung chương trình:</strong>\r\n</p>\r\n<p>- Khám & tư vấn miễn phí các bệnh về da, tiêm phòng giá gốc cho chó mèo.\r\n</P>\r\n<p>- Tẩy giun miễn phí</P>\r\n<p>- Tặng voucher 50k cho các dịch vụ tiêm vaccine, siêu âm thai, cắt tỉa, triệt sản</P>\r\n<p>\r\nChương trình KHÔNG GIỚI HẠN SỐ LƯỢNG người tham dự. Ngọc Pet xin dành tặng đến các khách hàng ưuđãi giảm giá 10% cho toàn bộ sản phẩm tại Ngọc Pet\r\n</P>\r\n<p>Đừng bỏ lỡ cơ hội thăm khám cho các bạn thú cưng để các boss yêu luôn khoẻ mạnh & phát triển toàn diện. Hãy chia sẻ cho người thân và bạn bè biết tới chương trình bổ ích này các bạn nhé!', '2'),
(2, 3, 'Kinh nghiệm nuôi chó Becgie đặc biệt chó Becgie con từ 2 tháng tuổi', 'Chó becgie nhỏ 2 tháng đã cai sữa mẹ và có thể xuất chuồng, đa phần các chủ chó con rất hay phân vân về cách nuôi chó becgie Đức, cho ăn như thế nào, vận động.', '../img/1812_cach-nuoi-cho-becgie-1.jpg', 'Chó becgie nhỏ 2 tháng đã cai sữa mẹ và có thể xuất chuồng, đa phần các chủ chó con rất hay phân vân về cách nuôi chó becgie Đức, cho ăn như thế nào, vận động.\r\n<br>\r\nChế độ dinh dưỡng, cách nuôi chó becgie nhỏ\r\n<br>\r\nMột lưu ý đầu tiên nhưng cũng rất quan trọng đó là thường khi mua chó con về chúng ta không nên cho chó ăn quá no hay quá nhiều. Tốt nhất nên hỏi qua chủ chó cách nuôi chó becgie nhỏ, thức ăn chúng hay ăn, chế độ ăn như thế nào. Trong 1 đến 5 ngày sau khi mua về các bạn có gắng giữ chế độ ăn của cún như cũ rồi thay đổi đần đần và từ từ trong 5 ngày để tránh trường hợp chó con lạ môi trường, lạ thức ăn sẽ dẫn đến rối loạn tiêu hóa, nếu không điều trị kịp thời sẽ trở thành bệnh rất phức tạp.\r\n<br>\r\n- Thức ăn cho chó becgie nhỏ bao gồm đầu cổ gà đã lọc bỏ da, gan phổi lợn, gan phổi bò, thịt nạc lợn vụn, thịt bò vụn, gân bò, trứng gà, trứng vịt lộn, sữa\r\n<br>\r\n- Tránh ăn thịt lợn mỡ, da cổ gà, mỡ bò vì khó tiêu và dễ đi ỉa\r\n<br>\r\nCách nuôi chó becgie nhỏ từ 8 tuần đến 12 tuần tuổi\r\n<br>\r\nTốt nhất cho ăn 4 lần một ngày , chia đều trong ngày sáng, trưa,,chiều, tối thời gian chia đều đừng để các bữa ăn quá sát nhau và đêm bị đói . Lượng thức ăn khoảng 700g chia đều, trong chuồng nước uống lúc nào cũng để sẵn hết ngày đổ thay bát khác. Cho uống 0,5 l sữa /ngày ( Chọn loại rẻ nhất ) , trứng gà cách ngày một quả ( Lúc đầu chó ăn chín , sau tái dần và tiến tới ăn sống ). Sau bữa ăn cho đi vệ sinh chỗ cố định và phải ép đi bằng được sẽ tạo được thói quen tốt .Lúc rỗi cho chạy dạo chơi , thời gian này chó vẫn còn ngủ nhiều và lười vận động.\r\n<br>\r\nCách nuôi chó becgie nhỏ từ 12 tuần đến 16 tuần tuổi\r\n<br>\r\nCho chó ăn ngày 3 bữa , lượng thức ăn khoảng 1,2 kg thức ăn tổng hợp chia đều các bữa . Sữa 1 lít , trứng cách ngày một quả . Thời gian này cho chó vận động nhiều , huấn luyện một số bài đơn giản , mang quả bong cao su đặc ném cho chó chạy đuuỏi bắt để phát triển xương Tìm hiểu thêm bài viết : Mua chó becgie\r\n<br>\r\nCách nuôi chó becgie nhỏ từ 16 tuần đến 20 tuần tuổi\r\n<br>\r\nChó chó ăn 3 bữa một ngày, tăng lượng đạm, thịt gia súc rẻ tiền ( Tránh ăn thịt lợn mỡ vì khó tiêu và dễ đi ỉa ) thức ăn 1,4 kg /ngày, sữa 1 lít, trứng gà ngày một quả. Thời gian vận động tăng cao, cho chạy hang ngày hoặc chạy theo xe đạp 5km trở lên .\r\n<br>\r\nCách nuôi chó becgie nhỏ từ 5,5 tháng trở lên\r\n<br>\r\nCó thể cho ăn như chó lớn, tăng cường cho ăn thêm thịt và vận động ở mức độ cao. Cho ăn 3 lần một ngày, khi cho đi tập hoặc đi dạo ép đi vệ sinh luôn. Ngày một lần là đủ, hạn chế công chăm sóc cho chủ chăn nuôi .\r\n<br>\r\nSau 6 tháng chó được chăm sóc như chó đã trưởng thành về chế độ ăn , vận động và huấn luyện . Thức ăn thừa của chó sau bữa ăn phải đổ đi , bát phải đánh rửa. Tránh tình trạng vì không có thời gian, cho chó đầy thức ăn cho ăn cả ngày, đễ bị ôi thiu , chó dễ bị đi ỉa . Tránh cho chó ăn quá no , hoặc quá đói. Ăn quá lo sẽ bị nôn ra, hoặc rối loạn tiêu hóa rất nguy hiểm . Tránh cho chó ăn cá, ruột cá và những đò ôi thiu . Những mảnh xương vụn ở canh phải lọc và đổ đi .\r\n<br>\r\nCho chó ăn đồ hạt khô phải nghâm nước trước sau đó ngoáy đều lên cho ăn . sáu tháng 1 lần nên tẩy giun cho chó vì giun sán có nhiều trong nội tạng gia súc. Hàng năm nên tiêm phòng dại cho chó, đây là điều bắt buộc cho sự an toàn của chủ. Khi chó có vấn đề cần gọi Bác sĩ thú y, tránh để nặng rồi mới gọi, hoặc tự chữa mà kiến thức có hạn\r\n<br>\r\nTẩy giun sán\r\n<br>\r\n>>> Tham khảo thuốc tẩy giun cho chó\r\n<br>\r\nĐối với chó dưới 6 tháng tuổi, nên tẩy giun khi được 1 tháng tuổi. Sau đó mỗi tháng tẩy lại 1 lần. cho đến khi được 6 tháng tuổi\r\n<br>\r\nĐối với chó trên 6 tháng tuổi, nên tẩy giun 3-4 tháng /1 lần\r\n<br>\r\nDòng chó becgie Đức là một trong những dòng chó vô cùng thông minh và được người dân Việt Nam rất là ưa chuộng.', '3'),
(3, 1, 'Mua hàng , nhận ngàn coupon', '‼ Mua hàng tại Ngọc Pet, tặng ngay coupon Khám chữa & Grooming\r\n \r\n? Từ ngày 20/07/2020, 10 Khách mua hàng đầu tiên tại Ngọc Pet sẽ được nhận coupon 30,000đ khi sử dụng dịch vụ Khám chữa & Grooming tại Bệnh viện thú y SamYang\r\n<br>\r\nNhanh chân lên, số lượng có hạn\r\n<br>\r\nLưu ý: Voucher có hạn sử dụng đến ngày 31/07/2020\r\n<br>\r\nXem thêm chương trình khuyến mãi sale up to 50% tại: https://www.facebook.com/Ng%E1%BB%8Dc-Pet-104100647932103/?epa=SEARCH_BOX', '../img/couple.png', 'Ngọc Pet – Lưu lại khoảnh khắc yêu thương cùng thú cưng của bạn ?\r\n=====================\r\n<br>\r\nMọi thắc mắc, bạn vui lòng liên hệ qua : \r\n<br>\r\nWebsite: www.khogiay.000webhostapp.com\r\n<br>\r\nFanpage facebook Ngọc Pet: https://www.facebook.com/Ng%E1%BB%8Dc-Pet-104100647932103/?epa=SEARCH_BOX\r\n<br>\r\n☎️ Hotline: 0912870820\r\n<br>\r\nNgọc Pet: Hệ thống siêu thị cho thú cưng hàng đầu Việt Nam\r\n', '1'),
(4, 1, '(26/05 - 01/06/2020) Quốc tế Thiếu nhi - Giá Sale hết ý', 'Hôm nay ngày Tết Thiếu nhi\r\n<br>\r\nMà Sen chẳng biết mua gì tặng con', '../img/qtethieunhi.png', 'Vậy Sen hãy gấp rút đến Ngọc Pet để mua hàng tá sản phẩm sành điệu, chính hãng và vô cùng hấp dẫn dành cho Boss thân yêu với giá giảm đến 50%\r\n<br>\r\nThời gian: 26/05 - 01/6/2020\r\n<br>\r\nChương trình được áp dụng tại Ngọc Pet, không áp dụng khi mua hàng ONLINE, không áp dụng đồng thời với các chương trình ưu đãi khác.', NULL),
(5, 1, 'NGỌC PET: MỞ THẺ NGAY - NHẬN QUÀ LIỀN TAY ', 'Từ ngày 18/05, Khách hàng lần đầu tiên mua hàng tại Ngọc Pet với hóa đơn trên 150,000đ sẽ được tặng ngay 1 lon pate Morando Made in Italy trị giá 50,000đ', '../img/mothe.png', '<br>\r\nLà hệ thống hàng chính hãng, hội tụ những sản phẩm hàng đầu trên thế giới, Sen có biết Ngọc Pet còn sở hữu những chính sách dành cho khách hàng tốt nhất hiện nay:\r\n<br>\r\n- Ưu đãi giảm giá vào Thứ Tư và Thứ Sáu hàng tuần\r\n<br>\r\n- Tích tem đổi quà hấp dẫn\r\n<br>\r\n- Freeship với hóa đơn trên 200,000đ và cách cửa hàng gần nhất không quá 8 km\r\n<br>\r\n- Ngập tràn ưu đãi vào các dịp Lễ lớn trong năm\r\n<br>\r\nNgọc Pet – Lưu lại khoảnh khắc yêu thương cùng thú cưng của bạn\r\n=====================\r\n<br>\r\nMọi thắc mắc, bạn vui lòng liên hệ qua :\r\n<br>\r\nWebsite: www.khogiay.000webhostapp.com\r\n<br>\r\nFanpage: https://www.facebook.com/Ng%E1%BB%8Dc-Pet-104100647932103/?epa=SEARCH_BOX\r\n<br>\r\n☎️ Hotline: 0912870820\r\n<br>\r\nNgọc Pet: Hệ thống siêu thị cho thú cưng ', NULL),
(6, 1, 'Đồ chơi Rubber - Cao su thiên nhiên, an toàn tuyệt đối<', '<br>\r\nBạn đang đau đầu khi thú cưng thường xuyên cắn phá đồ đạc trong nhà? \r\n<br>\r\nBạn cần tìm một sản phẩm an toàn, mẫu mã đẹp, giá cả phải chăng, Made in Vietnam nhưng chất lượng đạt chuẩn Châu Âu?\r\n<br>\r\nHãy sắm ngay cho bé Đồ chơi Rubber \r\n<br>\r\n✔️ Sản phẩm được làm từ 100% cao su thiên nhiên, có độ mềm, dẻo, dai vừa phải và đặc biệt an toàn\r\n<br>\r\n✔️ Đạt tiêu chuẩn Châu Âu, có giấy chứng nhận REACH, ROSH\r\n<br>\r\n✔️ Không độc hai, an toàn cho thú cưng khi cắn và ngậm.Độ đàn hồi cao, bền\r\n<br>', '../img/dochoi.png', '<br>\r\nMọi thắc mắc, bạn vui lòng liên hệ qua :\r\n<br>\r\nWebsite: www.khogiay.000webhostapp.com\r\n<br>\r\nFanpage: https://www.facebook.com/Ng%E1%BB%8Dc-Pet-104100647932103/?epa=SEARCH_BOX\r\n<br>\r\n☎️ Hotline: 0912870820\r\n', NULL),
(7, 2, '[THÔNG BÁO] Lịch nghỉ Tết Canh Tý 2020', 'Hệ thống siêu thị PetCity xin được gửi lời cảm ơn chân thành nhất tới Quý khách hàng đã cùng đồng hành cùng chúng tôi trong suốt những năm vừa qua', '../img/2101_720x325_1.png', '\r\n\r\nPetCity xin THÔNG BÁO LỊCH NGHỈ TẾT CANH TÝ 2020, cụ thể như sau:\r\n\r\nTất cả các cửa hàng thuộc Hệ thống PETCITY sẽ mở cửa đến 18h00 ngày 23/01/2020 (29/12 âm lịch).\r\nBộ phận ONLINE sẽ làm việc tới 17h30 ngày 22/01 (28 âm lịch)\r\nNgày 24/01/2020 (tức 30 Tết) mở cửa tại các cửa hàng sau:\r\n* Khu vực Hà Nội:\r\n- Thời gian bán hàng: 08h00 - 12h00 tại:\r\n+ 10 Hàm Long, Hà Nội - Hotline: 024 39332727\r\n* Khu vực Tp Hồ Chí Minh:\r\n- Thời gian bán hàng: 08h00 - 18h00 tại:\r\n+ 174 Cộng Hòa, Quận Tân Bình - Hotline: 028 3811 2799\r\n- Từ 8h00 ngày ngày 29/01/2020 (Mùng 5 tết), tất cả các cửa hàng của hệ thống sẽ hoạt động bình thường.\r\n- Bộ phận bán hàng qua hotline sẽ hoạt động vào 08h30 ngày 30/01/2020 (Mùng 6 tết).\r\nKính chúc Quý khách hàng cùng gia đình một Năm mới 2020 An khang, Thịnh Vượng và nhiều Sức khoẻ.\r\n', NULL),
(8, 2, 'NỘI DUNG CHƯƠNG TRÌNH EVENT CARE YOUR PET', 'CARE YOUR PET - Ngày Hội Tiêm Phòng Giá Gốc Và Khám Chữa Bệnh Về Da Miễn Phí Cho Thú Cưng ', '../img/2708_67549316_3087529404621088_7813171137835171840_n.png', 'I. Nội dung chương trình : \r\n<br>\r\n1. Khám chữa bệnh và tư vấn miễn phí các bệnh về da bởi đội ngũ y bác sĩ giàu kinh nghiệm\r\n<br>Tư vấn kiểm tra sức khỏe\r\n    <br>Siêu âm thai chó mèo\r\n    <br>Nhỏ gáy advocate - Bayer miễn phí (Phòng và điều chị nội ngoại kí sinh trùng : bọ chét,rận, ghẻ,ghẻ demodex,giun các loại)\r\n<br>Tiêm Phòng giá gốc :\r\n<br>\r\n    Vacxin dại: 30k\r\n    <br>Vacxin 5 bệnh: 100k\r\n    <br>Vacxin 7 bệnh: 150k\r\n    <br>Vacxin mèo: 250k\r\n    <br>Tẩy giun miễn phí\r\n<br>\r\n2.Chương Trình nhãn hàng Morando\r\n<br>\r\n  +)Free sample dòng siêu cao cấp Miogatto và Miocane cho các khách hàng tới check in + hashtag Morando ở chế độ công khai.\r\n  <br>+)Đối với các khách mua các sản phẩm Morando tại cửa hàng tặng thêm 1 pate cùng loại ( 1 sản phẩm + thêm 1 pate cùng loại )\r\n  <br>+)Sample Morando : 4 loại : Miocane junior , Miocane adult, Miogatto junior và miogatto adult.\r\n<br>\r\nII. Thời gian diễn ra chương trình :\r\n<br>\r\nNgày: 21/07/2020 - Từ 9h đến 16h30\r\n<br>\r\nĐịa điểm: Ngọc Pet- số 10,Chùa Hang, Đồng Hỷ, Thái Nguyên\r\n<br>\r\nĐăng ký ngay theo mẫ dưới để được tư vấn bạn nhé ^^', NULL),
(9, 2, '( 19/07/2020) Ngày hội tặng quà: Morando - Tinh hoa hương vị Ý', 'Ngày hội tặng quà: Morando - Tinh hoa hương vị Ý', '../img/2702_dang-ky-ngay-hoc-bong.png', 'Chủ nhật này, Ngọc Pet số 10 Chùa Hang có gì hot mà các Sen trầm trồ đến vậy?\r\n<br>\r\n✔️ Tặng #FREE sample Morando cho tất cả Sen đến cửa hàng trong khung giờ 9h30 - 12h\r\n<br>\r\n✔️ Tặng ngay combo: 1 gói thức ăn 1,5 kg và 1 lon pate 400 gram Morando \"Made in Italy\" khi check-in tại cửa hàng, kèm hashtag #Petcity#Morando, và share bài vào các hội nhóm thú cưng (số lượng có hạn)\r\n<br>\r\n✔️ Giảm 10% cho tất cả các sản phẩm Morando tại cửa hàng\r\n<br>\r\n✔️ Song song với đó, tại Ngọc Pet còn diễn ra chương trình \"Care Your Pet\" - Tiêm phòng giá gốc và khám chữa miễn phí\r\n<br>\r\n✔️ Bảo trợ hình ảnh trong chương trình: Sinba Pet Studio\r\n<br>\r\nSen còn chờ đợi gì, nhanh tay đăng ký đi thôi: https://bit.ly/2XjuBeL\r\n<br>\r\nChi tiết chương trình:\r\n<br>\r\n⏰ Thời gian: 9h30 - 12h ngày Chủ Nhật 19/07/2020\r\n<br>\r\n', NULL),
(10, 2, '( 25/07/2020 ) CARE YOUR PET - Ngày Hội Tiêm Phòng Giá Gốc Và Khám Chữa Bệnh Về Da Miễn Phí Cho Thú Cưng', 'CARE YOUR PET - Ngày Hội Tiêm Phòng Giá Gốc Và Khám Chữa Bệnh Về Da Miễn Phí Cho Thú Cưng ?', '../img/care.png', 'Đến với Ngọc Pet, thú cưng của bạn sẽ được khám chữa bệnh và tư vấn miễn phí các bệnh về da bởi đội ngũ y bác sĩ giàu kinh nghiệm, tâm huyết với nghề cùng tình yêu thương bao la dành cho động vật.\r\n<br>\r\nChương trình sẽ được diễn ra tại: Ngọc Pet\r\n<br>\r\nĐịa chỉ: 10 Chùa Hang, Đồng Hỷ, Thái Nguyên\r\n<br>\r\n⏰ Thời gian: 9h30 - 12h ngày 25/07/2020\r\n<br>\r\n⚕️ Chương trình KHÔNG GIỚI HẠN SỐ LƯỢNG người tham dự.\r\n<br>\r\nTất cả các Khách hàng tham dự sẽ được tặng gói thức ăn nhỏ tới từ thương hiệu Morando. Đặc biệt, tặng ngay combo: 1 gói thức ăn 1,5 kg và 1 lon pate 400 gram Morando \"Made in Italy\" khi check-in và share bài vào các hội nhóm.\r\n<br>\r\nSen còn chờ đợi gì, đăng ký cho Pet tham gia ngay thôi !\r\n<br>\r\nBảng giá tiêm vaccine niêm yết trong chương trình “Care Your Pet”:\r\n<br>\r\nVaccine Zoetis phòng 5 bệnh cho chó: #100k (Giá thị trường: 150k)\r\n<br>\r\nVaccine Zoetis phòng 7 bệnh cho chó: #130k (Giá thị trường: 180k)\r\n<br>\r\nVaccine Merial phòng 4 bệnh cho mèo: #200k (Giá thị trường: 250k)', NULL),
(11, 3, 'Thức ăn khô cho mèo Cat Eye chất lượng tốt, giá thành rẻ', 'Làm sao để cung cấp được đầy đủ chất dinh dưỡng cho quàng thượng ? Sản phẩm thức ăn hạt nào cung cấp được đủ các chất dinh dưỡng đó ? PetCity sẽ review cho các Sen một sản phẩm cực kì chất lượng mà giá lại siêu yêu luôn hạt dinh dưỡng đó', '../img/1301_2.jpg', '\r\n\r\nThương hiệu Cat Eye\r\n\r\nCùng với Royal Canin và Blisk, thương hiệu thức ăn cho mèo Cat Eye là một trong 3 thương hiệu được đánh giá tốt nhất cho dinh dưỡng của mèo. Đây là thương hiệu có xuất xứ từ Hàn Quốc, được phân phối ở khắp các quốc gia trên thế giới bởi thương hiệu này nổi tiếng là dòng thức ăn tốt nhất cho hệ tiêu hóa của mèo.\r\n\r\nSản phẩm thức ăn khô Cat Eye\r\n\r\nDùng được với cho mèo ở tất cả các độ tuổi : mèo nhỏ, mèo trung bình, mèo trưởng thành và nó còn không gây tác hại với cả những dòng mèo cái đang trong thời kỳ cho con bú.\r\n\r\nChính vì sự an toàn, lành tính này, nên rất nhiều các bạn tin thường rất hay sử dụng dạng thức ăn này để cung cấp dinh dưỡng cho mèo, kể cả khi mèo đang gặp các vấn đề về sức khỏe. \r\n\r\nThành phần\r\n\r\nBột Chicke, Bột cá, Ngô vàng, Lúa mì, Bột đậu nành, Gạo ủ, Bột củ cải, Cellulose dạng bột, Hạt lanh, Dầu đậu nành, Men khô, Mỡ động vật, Tiêu hóa gà khô, Taurine, Vitamin E, Vitamin C, Methionine , Kali Clorua, Choline Clorua, Ferlic Sulfate, Zinc Sulfate, Mangan Sulfate, Copper Oxide, Niacin, Canxi, Pantothenate, Riboflavin, Biotin, Folic Acid, Thiamine Mononitrate. Pyridoxine Clorua, Menadione Sodium Bisulfate (nguồn hoạt động của Vitamin K), Cobalt Sulfate, Natri Selenite, Canxi Iodate, Khoáng chất hữu cơ, Chiết xuất Yucca khô.\r\n\r\nCông dụng \r\n\r\n- Các thành phần dinh dưỡng giúp hỗ trợ tối đa hệ tiêu hóa, cải thiện vấn đề hấp thụ chất dinh dưỡng kể cả với những chú mèo đang gặp tình trạng yếu về sức khỏe.\r\n\r\n- Giúp cải thiện hệ thống miễn dịch của mèo và giúp cho mèo nhà bạn ăn ngon miệng hơn, đảm bảo sức khỏe hơn.\r\n\r\n- Với các vitamin và dưỡng chất, sản phẩm còn làm giảm lượng rụng lông, giúp mèo có làn da khỏe , lông bóng mượt, mềm mịn hơn.\r\n\r\n- Cat Eye phát huy tối đa thị lực của mèo \r\n\r\n- Đặc biệt thức ăn này còn làm giảm tỷ lệ lông vón cục trong hệ tiêu hóa, hỗ trợ đáng kể các vấn đề tiêu hóa mà mèo hay gặp phải.\r\n\r\nCách sử dụng : cho ăn trực tiếp (không qua chế \r\n\r\nBảo quản : ở nơi có không khí thoáng mát, tránh tiếp xúc với ánh nắng mặt trời', NULL),
(12, 3, 'Bệnh viêm khớp của chó, mèo và các triệu chứng', 'Thú cưng lớn tuổi đôi khi có thể vật lộn với đau khớp, đặc biệt là trong những tháng lạnh. Điều quan trọng là cha mẹ thú cưng phải theo dõi cẩn thận những người bạn đồng hành của chúng tôi và đảm bảo chúng tôi hành động ngay khi nhận thấy bất kỳ thay đổi nào trong hành vi.', '../img/1309_pet.jpg', 'Viêm xương khớp ở vật nuôi là gì?\r\n\r\nCác khớp vật nuôi của bạn được bọc trong sụn trong tình trạng liên tục bị phá vỡ, sản xuất và thay thế. Trong các khớp không lành mạnh, việc sản xuất sụn mới chậm hơn so với việc phá vỡ. Điều này gây ra sự mất cân bằng trong khớp vật nuôi của bạn, khiến chúng khó di chuyển hơn, gây đau đớn và khó chịu.\r\n\r\nCác triệu chứng như thế nào?\r\n\r\n    Giảm phạm vi chuyển động khớp\r\n    Không còn muốn đi dạo, hoặc đi bộ xa\r\n    Độ cứng\r\n    Khó leo cầu thang, lên giường v.v.\r\n    Khập khiễng hoặc khập khiễng\r\n    Thay đổi tính cách\r\n    Khó dậy vào buổi sáng\r\n\r\nMột số yếu tố của viêm Oestoarth ở vật nuôi là gì?\r\n\r\n    Tất cả các con chó cho dù kích thước của chúng có thể bị viêm khớp\r\n    Thú cưng thừa cân hoặc béo phì có nhiều khả năng xuất hiện các triệu chứng\r\n    Chấn thương có thể đóng góp và làm cho một điểm nóng cho viêm khớp hình thành\r\n    Chó hoạt động hoặc làm việc có nhiều khả năng bị viêm khớp\r\n    Chó già có nhiều khả năng phát triển nó khi chúng già đi\r\n\r\n( Tham khảo: https://www.arthritisact.org.au/fact-sheets/vi/VI_Osteoarthritis.pdf )\r\nLàm thế nào bạn có thể giúp giảm đau khớp?\r\n\r\nCó rất nhiều điều bạn có thể làm để hỗ trợ thú cưng của bạn trong những năm hoàng kim của mình, và làm cho mọi thứ dễ dàng hơn một chút. Đầu tiên là mang chúng trong nhà, và cho chúng bộ đồ giường hỗ trợ và thoải mái. Bộ đồ giường của họ nên là đồ lót hoặc có chăn để giữ ấm. Các khớp lạnh có nhiều khả năng bị đau.\r\n\r\nChế độ ăn của thú cưng mang lại sức khỏe cho chúng, vì vậy hãy đảm bảo cho chúng ăn thức ăn chất lượng cao hàng ngày. Giới thiệu các chất bổ sung là một trong những cách tốt nhất để thúc đẩy các khớp khỏe mạnh vì bạn có nhiều khả năng nhìn thấy kết quả tốt.\r\n\r\nGiảm mỡ thừa trên thú cưng của bạn có thể giúp giảm cân khỏi khớp. Cân nhắc việc nói chuyện với bác sĩ thú y về cân nặng lý tưởng của thú cưng của bạn và cố gắng đạt được mục tiêu đó. Một chút thay đổi trong chế độ ăn uống có thể giúp giảm trọng lượng thú cưng của bạn và giảm đau cho khớp của chúng', NULL),
(13, 3, 'Giống mèo thông minh nhất hành tinh', 'Mèo thông minh Abyssinian lông ngắn', '../img/meo-long-ngan-abyssinian-.jpg', 'Giữ vị trí quán quân trong top 10 giống mèo thông minh nhất hành tinh là Abyssinian – một giống mèo cổ xưa có nguồn gốc từ Ai Cập. Đây được coi là tổ tiên của mèo nhà mà chúng ta vẫn hay nuôi. Hiện tại Abyssinian đang cực kỳ được yêu thích tại Mỹ và đã trở thành giống mèo lông ngắn phổ biến nhất ở đây.\r\n<br>\r\nMèo Abyssinian được công nhận là loài động vật đặc biệt thông minh. Chúng rất gần gũi với con người và hay chơi đùa cùng chủ, thậm chí còn “đọc” được cả suy nghĩ của chủ nhân mình. Loài mèo này nổi tiếng về mức độ thông minh đến mức từng được nhắc đến trong bộ phim hoạt hình “Gia đình Simpson” với khả năng đổi kênh Tivi.\r\n<br>\r\nBên cạnh IQ cao, mèo thông minh Abyssinian còn sở hữu tính cách bướng bỉnh, nghịch ngợm, hay dỗi hờn. Nếu không được quan tâm hoặc thỏa mãn, những chú mèo này sẽ tỏ ra buồn bã, giận dỗi như một cô gái nhỏ nũng nịu.', NULL),
(14, 4, 'GIẢM 10% DỊCH VỤ GROOMING - CẮT TỈA XINH KHÔNG LO VỀ GIÁ', 'NGỌCPET x SAMYANG ANIMAL CLINIC: GIẢM 10% DỊCH VỤ GROOMING - CẮT TỈA XINH KHÔNG LO VỀ GIÁ ?', '../img/vuive.png', '<br>Samyang Animal Clinic: Giá rẻ - Chất lượng - Tiện lợi nay lại còn #SALE ✨\r\n<br>Sen hãy đưa Boss đến ngay Ngọc Petx SamYang để hưởng ưu đãi hấp dẫn: Giảm 10% dịch vụ cắt tỉa từ 18/07 - 31/08/2020 này nhé!\r\n<br>\r\nĐặc biệt, khi sử dụng dịch vụ Grooming tại SamYang, Khách hàng sẽ được tặng voucher giảm giá 5% khi mua hàng tại Ngọc Pet.\r\n<br>\r\nLink đăng ký: https://bit.ly/2ChO5qH\r\n<br>\r\n☎️ SĐT đặt lịch: 0912870820\r\n\r\n\r\n', NULL),
(15, 4, 'Tất tần tật về cách tắm cho chó từ A – Z', '1.Có nên tắm cho chó hay không?\r\n<br>\r\nKhác với cơ thể con người, chó không có tuyến mồ hôi trên da. Vì vậy mà khả năng trao đổi khí và độ ấm để tỏa nhiệt trên da là vô cùng nhỏ. Ở các vùng lạnh, người ta rất hạn chế tắm cho chó, thậm chí là không.\r\n<br>\r\nTuy nhiên, với khí hậu ở Việt Nam thì tắm cho chó là điều nên làm. Khí hậu nóng ẩm, sẽ có rất nhiều các bụi bẩn bám vào da và lông chó. Từ đó sẽ gây ra hiện tượng lông vón cục, bết lông. Các kí sinh trùng da như ve bọ, mòng… sẽ có cơ hội tấn cô', '../img/200268650-001.jpg', '<br>\r\n2. Bao lâu thì nên tắm cho chó?\r\n<br>\r\nChó không đòi hỏi một chế độ tắm thường xuyên như chúng ta. Tần suất tắm cho chó phụ thuộc vào nhiều yếu tố, chẳng hạn như môi trường sống, loại lông. Với những chú chó có bộ lông, da khỏe mạnh thì không nên tắm thường xuyên. Bởi điều này sẽ làm giảm độ bóng mượt của lông, gây khô da, thậm chí là tổn thương da.\r\n<br>\r\nNhìn chung, chúng ta nên tắm cho chó một tuần một lần với hầu hết các giống. Với một vài giống chó cụ thể, ta có thể tham khảo hướng dẫn dưới đây.\r\n<br>\r\nGiống Poodle: với một làn da nhiều dầu và nhờn, ta cần tắm thường xuyên hơn một lần một tuần.\r\n<br>\r\nBeagles và Pug: chúng có một bộ lông ngắn và mịn đang kinh ngạc. Do đó để duy trì được những đặc điểm tuyệt vời này, chúng ta nên tắm 2 tuần 1 lần cho chúng.\r\n<br>\r\nBasenjis: là một giống chó có khả năng tự chăm sóc tốt bộ lông của mình. Do vậy với mỗi 2 tháng 1 lần tắm là khoảng thời gian thích hợp.\r\n<br>    \r\nAlaska, husky, Golden: bạn cần thường xuyên trải lông và gỡ rối để giúp bé có một bộ lông khoẻ đẹp.\r\n<br>\r\n3. Thời điểm nào nên và không nên tắm cho chó?\r\n<br>\r\nCũng giống như người, chó cũng có những thời điểm nên và không nên tắm. Bạn cần nắm rõ điều này để đảm bảo hiệu quả của việc tắm cho chó. Không nên tắm cho chó khi:\r\n<br>\r\nSau khi ăn 2h\r\n<br>\r\nThời tiết lạnh dưới 18 độ C, nhất là với khí hậu miền bắc\r\n<br>\r\nChó con đang bú hoặc mới tách mẹ\r\n<br>    \r\nChó đang ốm hoặc có dấu hiệu ốm\r\n<br> \r\nChó cái đang kỳ động dục chuẩn bị phối giống. Nếu tắm sẽ giảm mùi “đặc trưng hấp dẫn ” làm giảm hưng phấn tính dục khi giao phối.\r\n<br>\r\nChó cái sau giao phối trong vòng 15 ngày\r\n<br>\r\nChó mới sinh con\r\n<br>\r\nChó mới mua về\r\n<br>\r\nChó mới tiêm phòng\r\n<br>\r\nNên tắm cho chó khi:\r\n<br>\r\nCó quá nhiều bụi bẩn, dịch nhầy, hay các chất lạ khác bám trên da và lông.\r\n<br>\r\nĐến lúc cần loại bỏ bớt lớp lông chết đã đến thời điểm rụng trên bộ lông của con vật.\r\n<br>\r\nSự tăng tiết bã nhờn làm cho chó bốc mùi.\r\n<br>\r\nLớp da chết tích lũy nhiều trên da tạo thành đám, vảy.\r\n<br>\r\nTa nên chọn thời điểm nắng ấm để tắm cho chó. Nên tránh tắm vào lúc cuối ngày, vì khó để bộ lông của chó khô hoàn toàn. Từ đó có thể dẫn đến các bệnh lý không đáng có về sau.\r\n<br>\r\n4. Hướng dẫn cách tắm cho chó\r\n<br>\r\nNgoại trừ những ngày nắng nóng, chúng ta nên tắm cho chó trong phòng tắm để đảm bảo mức nhiệt độ.\r\n<br>\r\nChuẩn bị trước khi tắm cho chó\r\n<br>\r\nSau khi đã xác định được thời điểm tắm cho chó, bạn nên tiến hành các thao tác chuẩn bị sau:\r\n<br>\r\nDùng 2 cục bông nhét vào 2 tai để tránh nước vào tai\r\n<br>\r\nChuẩn bị 1 tấm thảm cao su trong phòng tắm để tránh trong quá trình tắm chó bị trơn trượt. Điều này có thể khiến chú chó bị hoảng loạn.\r\n<br>\r\nNếu móng chân chó quá dài, bạn có thể cắt bớt\r\n<br>\r\nChuẩn bị 1 lọ thuốc mỡ thú y chuyên dụng, nếu chẳng may sữa tắm rơi vào mắt chó\r\n<br>\r\nCác bước tắm cho chó\r\n<br>\r\nBước 1: Chải lông thật kĩ cho chú chó của bạn bằng bàn chải chuyên dụng để gỡ rối lông, loại bỏ mảng bám.\r\n<br>\r\nBước 2: Lau nhẹ nhàng vành tai bằng 1 miếng vải ẩm để sạch bụi bẩn. Sử dụng nước với nhiệt độ thích hợp, dùng sữa tắm chuyên dụng dành cho cún và bắt đầu tắm cho chúng từ dưới chân lên thân trên. Dùng tay gãi nhẹ cho sữa tắm thấm đều khắp cơ thể và đi hết bụi bẩn, sau đó rửa sạch lại nhẹ nhàng bằng nước. Nếu chưa sạch, ta tiếp tục lặp lại quá trình tắm một lần nữa.\r\n<br>\r\n Bước 3: Lau khô bé bằng khăn khô và xốp, theo chiều từ trên xuống.\r\n<br>\r\n5. Những lưu ý quan trọng khi tắm cho chó\r\n<br>\r\n    Không nên sử dụng sữa tắm cho người, vì sữa tắm cho người có tính axit. Điều này sẽ không tốt cho da chó.\r\n    <br>Với những chú chó bị viêm da, bạn nên sử dụng sữa tắm theo chỉ định của bác sĩ thú y. Nếu chọn sai, có thể khiến cho bệnh nặng hơn.\r\n    <br>Nếu bạn đang sử dụng sữa tắm dược liệu để điều trị cho con vật thì sau khi bôi đều sữa tắm lên cơ thể nên để yên 10 phút cho ngấm vào da.\r\n    <br>Không nên tắm quá lâu sẽ không tốt cho sức khỏe của con vật.\r\n    Sau khi lau khô, nếu lông vẫn còn ướt, bạn có thể dùng máy sấy. Tuy nhiên bạn nên chọn chế độ gió mát để tránh làm khô da thú cưng. Sấy khô rất quan trọng với những giống chó lông dài, để ngăn ngừa các bệnh da liễu.\r\n    <br>Nếu chú chó không quen nghe tiếng kêu của máy sấy và có phản ứng dữ dội thì ta cũng không nên quá ép buộc.\r\n    <br>Nếu sau khi tắm, thú cưng có biểu hiện bất thường như sốt cao, bỏ ăn, run rẩy…bạn nên đưa ngay nó đến bác sỹ thú y để khám.\r\n    <br>Với những giống chó có bộ lông đặc thù như Poodles,Maltese, Springers, bạn nên đưa chúng tới các chuyên gia Grooming để nhận được sự tư vấn kĩ càng nhất về cách chăm sóc bộ lông cũng như cách nâng cao sức khoẻ da liễu của chúng.\r\n', NULL),
(16, 4, 'Chăm sóc tai chó có thật sự khó?', 'Làm sạch tai là một khía cạnh của việc chăm sóc lông thú cưng không nên bỏ qua. Nếu con chó của bạn thường xuyên cắt tỉa từ một chuyên gia chăm sóc chuyên nghiệp, có khả năng tai của nó được làm sạch đảm bảo, bạn có thể trao đổi để kiểm tra với người thợ để xác minh tình trạng vệ sinh tai của chú chó nhà bạn. Tai chó nếu không được vệ sinh thường xuyên, sáp và dầu tích tụ bên trong tai, làm tăng nguy cơ nhiễm trùng tai và tổn thương thính giác. Với suy nghĩ này, đó là một ý tưởng tốt cho bất kỳ ', '../img/2206_155449250_ear_cleaning.jpg', 'Bạn có thể sử dụng vật dụng gì để làm sạch Tai chó?\r\n<br>\r\nLàm sạch tai của chó đúng cách bắt đầu với việc thu thập đúng nguồn cung cấp . Đây là những gì bạn cần:\r\n<br>\r\nChất tẩy rửa tai: Hãy tìm một giải pháp làm sạch thương mại được bác sĩ thú y khuyên dùng. Tránh các chất tẩy rửa có chứa cồn hoặc hydro peroxide, có thể gây kích ứng cho đôi tai nhạy cảm của chú chó của bạn, cảnh báo Vật nuôi Spruce . Nếu bạn không chắc chắn liệu có gì đó ổn khi sử dụng cho con chó của bạn hay không, chỉ cần hỏi bác sĩ thú y hoặc người chăm sóc chó của bạn, \"Tôi có thể làm sạch tai chó của tôi bằng gì?\"\r\n<br>\r\nBông gòn hoặc miếng đệm: Bông gạc cũng có thể được sử dụng để làm sạch các đường rìa của tai ngoài, nhưng không bao giờ được đưa vào ống tai. Làm như vậy bạn có thể gây tổn thương thính giác vĩnh viễn.\r\n<br>\r\nNhíp: Đây là những thứ tốt để có trong tay nếu con chó của bạn có nhiều lông trong tai.\r\n<br>\r\nMột chiếc khăn: Điều này được khuyến khích để chứa những mớ hỗn độn tiềm ẩn, đặc biệt là nếu con chó của bạn dễ bị lắc đầu khi có thứ gì đó lọt vào tai.\r\nCách vệ sinh tai chó\r\n<br>\r\nTrước khi bạn bắt đầu, hãy dành một chút thời gian để kiểm tra tai con chó của bạn. Nếu chúng xuất hiện màu đỏ hoặc bị viêm, chúng có mùi khó chịu hoặc con chó của bạn có dấu hiệu bị ngứa, hãy dừng việc bạn đang làm và liên hệ với bác sĩ thú y của bạn. Con chó của bạn có thể bị nhiễm trùng hoặc nhiễm ve tai , một trong hai sẽ cần phải được điều trị. Nếu con chó của bạn có nhiều lông, hãy sử dụng nhíp để làm sạch lông ra khỏi ống tai. Một khi tai đã rõ và mọi thứ có vẻ bình thường, hãy đọc hướng dẫn trên chất tẩy rửa tai. Bạn cũng có thể làm theo quy trình từng bước này để làm sạch tai của chú chó của bạn:\r\n<br>\r\nSau khi cho con bạn ngồi, thưởng cho nó một chút gì đó và cho phép nó kiểm tra chai nước rửa tai.\r\n<br>\r\nNếu tai của con chó chưa cương cứng, hãy giữ nắp tai thẳng và cẩn thận làm đầy ống tai bằng dung dịch vệ sinh.\r\n<br>\r\nGiữ cho vạt tai tránh ra, nhẹ nhàng dùng ngón tay xoa bóp gốc tai trong khoảng hai mươi giây.\r\n<br>\r\nThả tai ra và cho phép con chó của bạn lắc đầu nếu nó muốn. Giữ một chiếc khăn trên đầu để ngăn dung dịch bay khắp nơi.\r\n<br>\r\nSử dụng một quả bóng bông hoặc một miếng bông quấn quanh ngón trỏ của bạn để lau nhẹ phần có thể nhìn thấy của ống tai chó và tai ngoài của bạn. Chỉ sử dụng tăm bông nếu cần thiết và chỉ trên phần có thể nhìn thấy của tai chó của bạn.\r\n<br>\r\nThưởng cho con chó của bạn với một miếng bánh thưởng khác và sau đó lặp lại các bước này cho tai khác.\r\n<br>\r\nMẹo và thủ thuật để làm cho nó dễ dàng hơn\r\n<br>\r\nMặc dù các bước liên quan đến cách làm sạch tai chó có thể khá đơn giản, nhưng đây là một vài mẹo sẽ giúp nó dễ dàng hơn cho cả bạn và chú chó của bạn.\r\n<br>\r\nTrừ khi bạn muốn có nước ở mọi nơi, hãy chắc chắn rằng con chó của bạn đang ở trong một khu vực hạn chế. Đặt con chó của bạn trong một bồn tắm hoặc mang nó ra bên ngoài. Hãy chắc chắn rằng bạn đang mặc quần áo cũ sẽ không bị hỏng nếu dung dịch tẩy rửa dính vào nó.\r\n<br>\r\nNgoài ra, đừng tiết kiệm dung dịch vệ sinh. Có rất nhiều thứ cho ống tai chó của bạn hơn những gì bạn có thể thấy. Làm đầy toàn bộ ống tủy bằng dung dịch sẽ giúp đảm bảo toàn bộ tai được làm sạch. Bất kỳ chất tẩy rửa dư thừa nào không bị xóa sổ sẽ bị trục xuất bởi con chó của bạn lắc đầu. Nếu tai vẫn có vẻ bẩn khi bạn thực hiện xong, hãy tiếp tục và lặp lại quy trình, và dừng ngay lập tức nếu bạn thấy đỏ hoặc chảy máu, hoặc nếu con chó của bạn có dấu hiệu khó chịu.\r\n<br>\r\nMột số con chó, đặc biệt là những con có tai ngắn và không có nhiều lông, đôi khi chỉ cần đôi tai của chúng bị xóa sạch khi chúng bắt đầu trông bẩn. Những con chó có đôi tai mềm và những con có nhiều lông quanh tai nên được kiểm tra và làm sạch kỹ lưỡng hơn ít nhất mỗi tuần.\r\n<br>\r\nBiết cách làm sạch tai chó là một phần cơ bản trong việc chải chuốt cho thú cưng của bạn. Đảm bảo rằng việc này được thực hiện một cách thường xuyên sẽ giúp bảo vệ thính giác của anh ấy và đảm bảo rằng đôi tai của con bạn luôn khỏe mạnh trong suốt cuộc đời.', '4'),
(17, 4, 'Lựa chọn tông đơ đúng để cắt tỉa lông cho thú cưng', 'Một số giống chó cần chú ý đặc biệt tới bộ lông có thể kể đến như Bichon Frise, Yorkshire Terrier, Samoyed, Poodle… hiện nay ở Việt Nam giống chó Poodle, Sammoyed, Corgi khá phổ biến và thường gặp.  Nếu bạn sở hữu một em cún thuộc các giống này thì việc cắt tỉa lông cho chúng là việc chắc chắn sẽ phải làm. Nếu có thời gian bạn có thể đưa các bé tới trung tâm chăm sóc thú nuôi để cắt tỉa lông, còn nếu bạn muốn cắt tỉa lông cho chúng tại nhà thì bạn nên sử dụng dụng cụ phù hợp như tông đơ cắt tỉa ', '../img/2003_Untitled3-copy.jpg', '<br>Thế nào là tông đơ cắt lông chó, mèo tốt?\r\n<br>\r\nBạn là người yêu thú cưng như chó và mèo thì chắc chắn bạn sẽ biết rằng việc chăm sóc lông cho chúng đóng vai trò hết sức quan trọng. Bộ lông khỏe mạnh là yếu tố quan trọng ảnh hưởng tới sức khỏe những người bạn thân thiết của chúng ta. Khi chọn mua một chiếc để chăm sóc lông cho thú cưng chúng ta cần quan tâm những điều sau. Đầu tiên là chọn loại tông không dây hay có dây, tiếp đến là lựa chọn động cơ công suất bao nhiêu sau đó là lựa chọn lưỡi cắt được làm từ chất liệu nào và cuối cùng là các dụng cụ hỗ trợ, khả năng bảo dưỡng của bộ sản phẩm đó.\r\n<br>\r\nNhư chúng ta đã biết tông đơ cắt tỉa lông chó, mèo có hai loại là loại dùng điện trực tiếp hay còn gọi là tông có dây và tông dùng pin sạc (tông không dây). Loại tông có dây thường khá nặng, cách sử dụng khó khăn, khá vướng víu vì phải cắm dây khi sử dụng, kém linh hoạt hơn hơn tuy nhiên lại mạnh mẽ hơn tông không dây. Tông không dây thì độ linh hoạt cao, sử dụng dễ dàng và tiện lợi hơn nhưng có công suất yếu hơn.\r\n<br>\r\nMặc dù vậy trong khoảng 1-2 năm trở lại đây các sản phẩm tông đơ cắt lông chó có dây đang trở nên lép vế hơn so với tông đơ tỉa lông chó, mèo, cắt lông chó mèo không dây khi các sản phẩm không dây có công suất ngày càng tăng cao, sử dụng dễ dàng, bảo dưỡng và vệ sinh đơn giản. Công suất của những chiếc tông dùng pin, sạc giờ đã đạt mức 12 – 18W thoải mái cho chúng ta sử dụng để cắt tỉa lông cho chó mèo.\r\n<br>\r\nTiếp đến chúng ta sẽ cần chú ý tới lưỡi cắt. Lưỡi cắt là bộ phận rất quan đối với một chiếc tông tốt, một sản phẩm tốt đòi hỏi lưỡi cắt phải sắc, bền, ít bị mài mòn và không bị nóng lên khi sử dụng. Đặc biệt là với các giống chó mèo lông dậm và dày thì tông cắt lông cho chúng phải có lưỡi sắc để không bị kẹt hay dứt lông khiến chúng bị đau. Các loại tông với lưỡi từ thép các bon cao, titanium và sứ Zr02 là những bộ sản phẩm bạn nên chọn để cắt tỉa lông cho chó mèo.\r\n<br>\r\nCác dụng cụ hộ trợ cũng như việc vệ sinh, bảo dưỡng tháo lắp có dễ dàng đơn giản hay không cũng là việc bạn nên quan tâm. Nếu việc sử dụng quá khó khăn và việc bảo dưỡng chúng quá mất thời gian thì bạn cũng không nên chọn chiếc tông đó cho việc cắt lông chó mèo. Các dụng cụ kèm theo nên đầy đủ cả dầu máy, chổi lông và cữ (điều chỉnh độ dài khi cắt)', NULL),
(20, 3, 'Chỉ người nuôi mèo mới hiểu những chuyện cười ra nước mắt này', 'Chỉ người nuôi mèo mới biết “hoàng thượng” chảnh thế nào\r\nChắc hẳn những người nuôi mèo cảnh một thời gian đều phải công nhận một điều, cụm từ “chảnh chó” đáng lẽ phải đổi lại thành “chảnh mòe” mới đúng. Rõ ràng các chú cún đều rất thân thiện, quấn chủ, biết nghe lời, còn mèo thì ngược lại. Chúng chẳng những lờ lớ lơ mỗi khi bạn muốn nựng một chút, mà thậm chí còn sẵn sàng ịn mông vào mặt chủ để thể hiện tình cảm.', '../img/00.jpg', '<p style=\"text-align:justify\">Người nu&ocirc;i m&egrave;o chuẩn bị cho c&aacute;c Boss n&agrave;o l&agrave; chăn ấm, nệm &ecirc;m, giường rộng, v&otilde;ng xịn. Thế nhưng ch&uacute;ng lại tỏ ra gh&eacute;t bỏ những m&oacute;n đồ n&agrave;y, thay v&agrave;o đ&oacute; chỉ th&iacute;ch nằm th&ugrave;ng carton hay chiếm chỗ ngủ của bạn v&agrave; ch&uacute; ch&oacute; tội nghiệp.&nbsp;M&egrave;o cũng chẳng th&egrave;m uống nước trong b&aacute;t của ch&uacute;ng m&agrave; cứ &ldquo;thị tẩm&rdquo; lọ hoa hoặc cốc nước bạn đang d&ugrave;ng.</p>\r\n\r\n<p style=\"text-align:justify\">Đặc biệt, người nu&ocirc;i m&egrave;o h&atilde;y l&agrave;m quen với việc bị Boss xoay m&ocirc;ng v&agrave;o mặt mỗi khi đi l&agrave;m về thay v&igrave; mừng rỡ rối r&iacute;t như c&aacute;c ch&uacute; c&uacute;n. Đừng tổn thương hay thất vọng trước việc n&agrave;y v&igrave; bạn sẽ c&ograve;n phải tổn thương d&agrave;i d&agrave;i.</p>\r\n\r\n<p style=\"text-align:justify\">Cũng đừng tr&ocirc;ng chờ v&agrave;o việc c&aacute;c &ldquo;qu&agrave;ng thượng&rdquo; sẽ chơi đ&ugrave;a với người nu&ocirc;i m&egrave;o mỗi khi họ muốn. Ch&uacute;ng phớt lờ mọi sự quan t&acirc;m, lấy l&ograve;ng, chỉ một mực nằm ngủ hoặc ngồi ngẩn ra phơi nắng. Ngược lại, đến khi bạn đang bận sấp mặt th&igrave; Boss lại xuất hiện như một vị thần, ngồi l&ecirc;n laptop hay nghịch c&acirc;y lau nh&agrave; của bạn. T&oacute;m lại, chỉ c&oacute; ch&uacute;ng được &ldquo;bơ&rdquo; bạn c&ograve;n bạn th&igrave; kh&ocirc;ng c&oacute; quyền đ&oacute; đ&acirc;u.</p>\r\n', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `birthday` int(11) NOT NULL,
  `created_time` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `fullname`, `password`, `birthday`, `created_time`, `last_updated`) VALUES
(1, 'admin', 'Andn', '25d55ad283aa400af464c76d713c07ad', 123, 123, 1553185530);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `image_library`
--
ALTER TABLE `image_library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_loai_san_pham`
--
ALTER TABLE `tbl_loai_san_pham`
  ADD PRIMARY KEY (`id_loai_san_pham`);

--
-- Chỉ mục cho bảng `tbl_loai_tin_tuc`
--
ALTER TABLE `tbl_loai_tin_tuc`
  ADD PRIMARY KEY (`id_loai_tin_tuc`);

--
-- Chỉ mục cho bảng `tbl_san_pham`
--
ALTER TABLE `tbl_san_pham`
  ADD PRIMARY KEY (`id_san_pham`),
  ADD KEY `id_loai_san_pham` (`id_loai_san_pham`);

--
-- Chỉ mục cho bảng `tbl_tin_tuc`
--
ALTER TABLE `tbl_tin_tuc`
  ADD PRIMARY KEY (`id_tin_tuc`),
  ADD KEY `id_loai_tin_tuc` (`id_loai_tin_tuc`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `image_library`
--
ALTER TABLE `image_library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `tbl_loai_san_pham`
--
ALTER TABLE `tbl_loai_san_pham`
  MODIFY `id_loai_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tbl_loai_tin_tuc`
--
ALTER TABLE `tbl_loai_tin_tuc`
  MODIFY `id_loai_tin_tuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_san_pham`
--
ALTER TABLE `tbl_san_pham`
  MODIFY `id_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `tbl_tin_tuc`
--
ALTER TABLE `tbl_tin_tuc`
  MODIFY `id_tin_tuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_san_pham`
--
ALTER TABLE `tbl_san_pham`
  ADD CONSTRAINT `tbl_san_pham_ibfk_1` FOREIGN KEY (`id_loai_san_pham`) REFERENCES `tbl_loai_san_pham` (`id_loai_san_pham`);

--
-- Các ràng buộc cho bảng `tbl_tin_tuc`
--
ALTER TABLE `tbl_tin_tuc`
  ADD CONSTRAINT `tbl_tin_tuc_ibfk_1` FOREIGN KEY (`id_loai_tin_tuc`) REFERENCES `tbl_loai_tin_tuc` (`id_loai_tin_tuc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
