SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET NAMES utf8mb4;

-- ------------------------
-- TABLE: trangthaithucthe
-- ------------------------
CREATE TABLE `trangthaithucthe` (
  `maTrangThai` int(11) NOT NULL,
  `tenTrangThai` varchar(50) NOT NULL,
  PRIMARY KEY (`maTrangThai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `trangthaithucthe` VALUES
(0, 'Khóa / Ẩn'),
(1, 'Hoạt động');

-- ------------------------
-- TABLE: trangthaisanpham
-- ------------------------
CREATE TABLE `trangthaisanpham` (
  `maTrangThai` int(11) NOT NULL,
  `tenTrangThai` varchar(50) NOT NULL,
  PRIMARY KEY (`maTrangThai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `trangthaisanpham` VALUES
(0, 'Hết hàng'),
(1, 'Còn hàng'),
(2, 'Khuyến mãi hot');

-- ------------------------
-- TABLE: danhmuc
-- ------------------------
CREATE TABLE `danhmuc` (
  `maDanhMuc` int(11) NOT NULL AUTO_INCREMENT,
  `tenDanhMuc` varchar(255) NOT NULL,
  `trangThaiDanhMuc` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`maDanhMuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `danhmuc` VALUES
(1, 'T-Shirt', 1),
(2, 'Hoodie', 1),
(3, 'Pants', 1),
(4, 'Shirt', 1);

-- ------------------------
-- TABLE: sanpham
-- ------------------------
CREATE TABLE `sanpham` (
  `maSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `tenSanPham` varchar(255) NOT NULL,
  `giaSanPham` int(11) NOT NULL,
  `soLuongSanPham` int(11) NOT NULL,
  `hinhAnhSanPham` varchar(255) NOT NULL,
  `moTaSanPham` text DEFAULT NULL,
  `maDanhMuc` int(11) NOT NULL,
  `trangThaiSanPham` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`maSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sanpham` VALUES
(1, 'Áo T-Shirt Raglan Classic', 250000, 50, '16typh.png', 'Cotton thoáng mát', 1, 1),
(2, 'Áo Hoodie Dirty Coins', 450000, 30, 'butterfly.png', 'Nỉ dày form rộng', 2, 1),
(3, 'Quần Khaki Baggy Pants', 320000, 40, 'pant1.png', 'Dáng suông thoải mái', 3, 1),
(4, 'Áo Sơ Mi Flannel Shirt', 290000, 25, 'shirt1.png', 'Kẻ caro cá tính', 4, 1);

-- ------------------------
-- TABLE: khachhang
-- ------------------------
CREATE TABLE `khachhang` (
  `maKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `tenDangNhap` varchar(50) NOT NULL,
  `matKhau` varchar(255) NOT NULL,
  `tenKhachHang` varchar(255) NOT NULL,
  `diaChi` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `soDienThoai` varchar(15) DEFAULT NULL,
  `ngayTao` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`maKhachHang`),
  UNIQUE KEY `tenDangNhap` (`tenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `khachhang` VALUES
(18, 'user1', '123', 'vuhaiquan', 'hanoi', 'abc123@gmail.com', '0123123123', '2026-04-19 16:15:42');

-- ------------------------
-- TABLE: quanly
-- ------------------------
CREATE TABLE `quanly` (
  `maQuanly` int(11) NOT NULL AUTO_INCREMENT,
  `tenDangNhap` varchar(50) NOT NULL,
  `matKhau` varchar(255) NOT NULL,
  `tenQuanLy` varchar(255) NOT NULL,
  `trangThaiTaiKhoan` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`maQuanly`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `quanly` VALUES
(1, 'admin', '123', 'nguoi quan ly', 1);

-- ------------------------
-- FOREIGN KEY (SAU KHI TẠO BẢNG)
-- ------------------------
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SanPham_DanhMuc`
  FOREIGN KEY (`maDanhMuc`) REFERENCES `danhmuc` (`maDanhMuc`);

ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SanPham_TrangThai`
  FOREIGN KEY (`trangThaiSanPham`) REFERENCES `trangthaisanpham` (`maTrangThai`);

ALTER TABLE `quanly`
  ADD CONSTRAINT `FK_QuanLy_TrangThai`
  FOREIGN KEY (`trangThaiTaiKhoan`) REFERENCES `trangthaithucthe` (`maTrangThai`);

COMMIT;