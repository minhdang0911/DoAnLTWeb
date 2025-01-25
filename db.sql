create database DoAnWeb
go
use DoAnWeb
go
create table Loaisp
(
maloaisp int identity primary key,
tenloaisp nvarchar(30)
)
go
create table SanPham
(
masp int identity(1,1) primary key,
maloaisp int references Loaisp(maloaisp),
tensp nvarchar(100) not null,
hinh varchar(50),
giaban decimal(18,0),
ngaycapnhat smalldatetime,
soluongton int
)
go

create table KHACHHANG(
MaKH int identity(1,1) primary key,
HoTen nvarchar(50),
TenDangNhap varchar(20),

MatKhau varchar(10),
Email varchar(50),
DiaChi nvarchar(100),
DienThoai varchar(15),
NgaySinh  date
)







create table DONHANG(
MaDon int identity(1,1) primary key,
ThanhToan bit,
GiaoHang bit,
NgayDat date,
NgayGiao date,
MaKH int references KhachHang(makh)
)
create table CHITIETDONHANG(
MaDon int references DonHang(madon),
masp int references SanPham(masp),
SoLuong int,
Gia decimal(18,0),
primary key(madon,masp)
)



insert into Loaisp(tenloaisp) values(N'	ghế sofa')
insert into Loaisp(tenloaisp) values(N'bếp module')
insert into Loaisp(tenloaisp) values(N'giường ngủ nhật')
insert into Loaisp(tenloaisp) values(N'Bàn Trà ')
insert into Loaisp(tenloaisp) values(N'Tủ áo ')
insert into Loaisp(tenloaisp) values(N'Hệ tủ bếp đẹp bằng gỗ')
insert into Loaisp(tenloaisp) values(N'Tủ quần áo')
insert into Loaisp(tenloaisp) values(N' Hệ tủ bếp')
insert into Loaisp(tenloaisp) values(N'Giường Ngủ')
insert into Loaisp(tenloaisp) values(N'Ghế sofa nệm')
insert into Loaisp(tenloaisp) values(N'Harmony')
insert into Loaisp(tenloaisp) values(N'Tủ ly ')
insert into Loaisp(tenloaisp) values(N'Giường hộc kéo')
insert into Loaisp(tenloaisp) values(N'Bàn ăn')
insert into Loaisp(tenloaisp) values(N'Tủ bếp')


insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(1,N'Sofa da bò Ý 100% da thật
','/Content/images/sp1.jpg',20000000,'12/02/2022',15)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(2,N' Hệ bếp module gỗ thiết kế thông minh GHS- 
','/Content/images/sp2.jpg',10000000,'12/02/2022',20)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(3,N'Giường ngủ bằng gỗ kiểu Nhật GHS-9234  
','/Content/images/sp3.jpg',8000000,'02/24/2022',10)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(4,N'  Bàn Trà Mặt Đá-BT21    
','/Content/images/sp4.jpg',3000000,'02/13/2022',5)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(5,N'Tủ áo cửa lùa 3 cánh – TQADK10 
','/Content/images/sp5.jpg',20000000,'02/14/2022',4)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(6,N'  Hệ tủ bếp đẹp bằng gỗ công nghiệp GHS-51785 
','/Content/images/sp6.jpg',15000000,'03/12/2022',20)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(7,N'  Tủ quần áo sang trọng kết cấu chắc chắn GHS-51508    
','/Content/images/sp7.jpg',15000000,'02/25/2022',9)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(8,N'  Hệ tủ bếp đẹp bằng gỗ công nghiệp GHS- 
','/Content/images/sp8.jpg',11000000,'02/12/2022',6)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(9,N'Giường Ngủ - GN34  
','/Content/images/sp9.jpg',10000000,'02/27/2022',4)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(10,N'Ghế sofa nệm đa năng MH08
','/Content/images/sp10.jpg',5000000,'02/23/2022',25)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(11,N'Tủ áo Harmony
','/Content/images/sp11.jpg',9000000,'02/27/2022',16)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(12,N'Tủ ly Bridge Gỗ màu Tự nhiên
','/Content/images/sp12.jpg',50000000,'02/12/2022',3)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(13,N'Giường hộc kéo Iris 1m8 Stone
','/Content/images/sp13.jpg',20000000,'02/14/2022',5)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(14,N'Bàn ăn Jazz 1m6
','/Content/images/sp14.jpg',18000000,'02/17/2022',5)
insert into Sanpham(maloaisp,tensp,hinh,giaban,ngaycapnhat,soluongton) values(15,N'Tủ bếp Fancy
','/Content/images/sp15.jpg',25000000,'02/23/2022',2)



