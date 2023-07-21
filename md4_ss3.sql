create database quanlybanhang;
use quanlybanhang;
create table khachhang(
makh varchar(4) primary key,
tenkh varchar(30) not null,
 diachi varchar(50),
 ngaysinh datetime,
 sodt varchar(15)
);
insert into khachhang(makh,tenkh,diachi) values
("001","Hiếu","Cà Mau"),("002","Giang","Thái Nguyên"),("003","Hùng","Nam Định"),("004","Phat","Nghe An");
create table nhanvien(
manv varchar(4) primary key,
hoten varchar(30) not null,
gioitinh bit not null,
diachi varchar(50) not null,
ngaysinh datetime not null,
dienthoai varchar(15),
email text,
noisinh varchar(20) not null,
ngayvaolam datetime,
manql varchar(4)
);

insert into nhanvien(manv,hoten,gioitinh,diachi,ngaysinh,noisinh) values
 ("111","Hiếu Máy Dập",1,"Đình Thôn","1999/9/9","CM"),
 ("112","Hùng Nghiện",1,"Noxsus","2004/4/4","Ionia"),
 ("113","Phát Gà",1,"Surima","2004/5/5","Zaun"),
 ("113","Duy Nava",0,"Demacia","1998/8/8","Zaun");
create table nhacungcap(
mancc varchar(4) primary key,
tenncc varchar(50) not null,
diachi varchar(50) not null,
dienthoai varchar(15) not null,
email varchar(30) not null,
webside varchar(30)
);
insert into nhacungcap(mancc,tenncc,diachi,dienthoai,email) values 
("0001","Lux","Demacia","0999666888","lux_dema@gmail.com"),
("0002","Miss","Bigtover","0999888888","forturn_big@gmail.com"),
("0003","Yasua","Ionia","0999222666","hasaghi@gmail.com"),
("0004","Draven","Noxsus","0999999999","ontop1@gmail.com"),
("0005","Yumi","Pitover","0999456789","myboss@gmail.com");

create table loaisp(
maloaisp varchar(4) primary key,
tenloaisp varchar(30) not null,
ghichu varchar(30)
);
insert into loaisp(maloaisp,tenloaisp) values 
("111")

create table sanpham(
masp varchar(4) primary key,
maloaisp varchar(4) not null,
tensp varchar(50) not null,
donvitinh varchar(10) not null,
ghichu varchar(100),
foreign key(maloaisp) references loaisp(maloaisp)
);

create table phieunhap(
sopn varchar(4) primary key,
manv varchar(4) not null,
mancc varchar(4) not null,
ngaynhap datetime not null,
ghichu varchar(100),
foreign key(manv) references nhanvien(manv),
foreign key(mancc) references nhacungcap(mancc)
);

create table ctphieunhap(
masp varchar(4) not null,
sopn varchar(4) not null,
soluong smallint not null,
gianhap real not null check (gianhap>=0),
foreign key(masp) references sanpham(masp), 
foreign key(sopn) references phieunhap(sopn) 
);
create table phieuxuat(
sopx varchar(4) primary key,
manv varchar(4) not null,
makh varchar(4) not null,
ngayban datetime not null,
ghichu text,
foreign key(manv) references nhanvien(manv),
foreign key(makh) references khachhang(makh)
);
create table ctphieuxuat(
sopx varchar(4) not null,
masp varchar(4) not null,
soluong smallint not null,
giaban real not null,
foreign key(sopx)references phieuxuat(sopx),
foreign key(masp) references sanpham(masp)
);