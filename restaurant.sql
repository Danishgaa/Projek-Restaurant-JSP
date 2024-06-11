create database restaurant
use restaurant
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) unique,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) default('user')
);

drop table menu
CREATE TABLE menu (
    kode INT PRIMARY KEY IDENTITY(1,1),
	id_user int,
    nama_makanan VARCHAR(50),
    jumlah INT,
	rasa varchar(100),
    alamat VARCHAR(100),	
    informasi VARCHAR(100),
	total_harga int
);
	
INSERT INTO users (username, password, role) VALUES ('admin', 'adminpass', 'admin');
INSERT INTO users (username, password) VALUES ('user', 'userpass');

	select * from users

	select top 1 * from menu order by kode desc;