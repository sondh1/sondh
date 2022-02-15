USE master
GO

IF  EXISTS (
	SELECT name 
		FROM sys.databases 
		WHERE name = N'DBQuanLy'
)
DROP DATABASE DBQuanLy
GO

CREATE DATABASE DBQuanLy
GO

USE DBQuanLy
GO

CREATE TABLE TAIKHOAN
(
	USERNAME VARCHAR(30) PRIMARY KEY NOT NULL,
	PASSWORD VARCHAR(30) NOT NULL,
	HOTEN NVARCHAR(50) NOT NULL,
	PHANQUYEN NVARCHAR(30) NOT NULL,
)
GO

CREATE TABLE LIENHE
(
	MaLH INT PRIMARY KEY NOT NULL,
	TenLH NVARCHAR(50) NOT NULL,
	DiaChiLH NVARCHAR(100) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
)
GO

CREATE TABLE PHANLOAI
(
	MaLoai INT PRIMARY KEY NOT NULL,
	TenLoai NVARCHAR(50) NOT NULL,
)
GO

CREATE TABLE NHACUNGCAP
(
	MaNCC INT PRIMARY KEY NOT NULL,
	TenNCC NVARCHAR(100) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SDT VARCHAR(20) NOT NULL,
)
GO

CREATE TABLE NGUYENLIEU
(
	MaNL INT PRIMARY KEY NOT NULL,
	TenNL NVARCHAR(100) NOT NULL,
	MaNCC INT NOT NULL,
	FOREIGN KEY (MaNCC) REFERENCES NHACUNGCAP (MaNCC),

)
GO

CREATE TABLE TRASUA
(
	MaTS INT PRIMARY KEY NOT NULL,
	TenTS NVARCHAR(30) NOT NULL,
	GiaBan NVARCHAR(50) NOT NULL,
	MoTa NVARCHAR(100) NOT NULL,
	Anh NVARCHAR(100) NOT NULL,
	MaNL INT NOT NULL,
	MaLoai INT NOT NULL,
	FOREIGN KEY (MaNL) REFERENCES NGUYENLIEU (MaNL),
	FOREIGN KEY (MaLoai) REFERENCES PHANLOAI (MaLoai),

)
GO

CREATE TABLE KHACHHANG
(
	MaKH INT PRIMARY KEY NOT NULL,
	TenKH NVARCHAR(30) NOT NULL,
	NgaySinh DATETIME NOT NULL,
	USERNAME VARCHAR(30) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(200) NOT NULL,
	DienThoai VARCHAR(20) NOT NULL,
	FOREIGN KEY (USERNAME) REFERENCES TAIKHOAN (USERNAME),
)
GO

CREATE TABLE DONHANG
(
	MaDH INT PRIMARY KEY NOT NULL,
	ThanhToan bit NOT NULL,
	TinhTrangGiaoHang bit NOT NULL,
	NgayDat datetime NOT NULL,
	NgayGiao datetime NOT NULL,
	MaKH INT NOT NULL,
	GhiChu NVARCHAR(100) NOT NULL,
	FOREIGN KEY (MaKH) REFERENCES KHACHHANG (MaKH),
)
GO

CREATE TABLE CHITIETDONHANG
(
	MaDH INT NOT NULL,
	MaTS INT NOT NULL,
	SoLuuong INT NOT NULL,
	DonGia decimal(18,0) NOT NULL,
	PRIMARY KEY(MaDH, MaTS),
	FOREIGN KEY (MaTS) REFERENCES TRASUA (MaTS),
	FOREIGN KEY (MaDH) REFERENCES DONHANG (MaDH),
	
)
GO

CREATE TABLE NHANVIEN
(
	MaNV INT PRIMARY KEY NOT NULL,
	TenNV NVARCHAR(30) NOT NULL,
	NgaySinh datetime NOT NULL,
	USERNAME VARCHAR(30) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(200) NOT NULL,
	DienThoai NVARCHAR(20) NOT NULL,
	STK VARCHAR(50) NOT NULL,
	Luong INT NOT NULL,
	FOREIGN KEY (USERNAME) REFERENCES TAIKHOAN (USERNAME),
)
GO

CREATE TABLE TEST
(
	MaTest int PRIMARY KEY not null,
)
