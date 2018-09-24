create table Pemilik (
	idPemilik	varchar2(10),
	namaPemilik varchar2(25),
	kontakPemilik varchar2(12),

	CONSTRAINT PK_Pemilik PRIMARY KEY (idPemilik)
);

create table PenyediaStand(
	idStand	varchar2(10),
	NamaPStand varchar2(25),
	kontakPStand	varchar2(12),
	idPemilik varchar2(10),

	CONSTRAINT PK_PenyediaStand PRIMARY KEY (idStand),
	CONSTRAINT FK_PenyediaStand FOREIGN KEY (idPemilik)
	REFERENCES Pemilik (idPemilik)
);

create table Supplier (
	idSupplier varchar2(10),
	namaSupplier varchar2(25),
	kontakSupplier varchar2(12),
	idPemilik varchar2(10),

	CONSTRAINT PK_Supplier PRIMARY KEY (idSupplier),
	CONSTRAINT FK_Supplier FOREIGN KEY (idPemilik)
	REFERENCES Pemilik (idPemilik)
);

create table Keuangan (
	tglLaporan date,
	statusBisnis varchar2(8),
	jumMasukkan integer,
	jumKeluaran integer,
	modal integer,
	idPemilik varchar2(10)

	CONSTRAINT PK_Keuangan PRIMARY KEY (tglLaporan)
	CONSTRAINT FK_Keuangan FOREIGN KEY (idPemilik)
	REFERENCES Pemilik (idPemilik)
);

create table Pelanggan (
	idPelanggan varchar2(10),
	namaPelanggan varchar2 (25),
	idPemilik varchar2 (10),

	CONSTRAINT PK_Pelanggan PRIMARY KEY (idPelanggan),
	CONSTRAINT FK_Keuangan FOREIGN KEY (idPemilik)
	REFERENCES Pemilik (idPemilik)
);

create table Menu (
	idMenu varchar2(10),
	namaMenu varchar2(25),
	hargaMenu integer,
	idPemilik varchar2(10),

	CONSTRAINT PK_Menu PRIMARY KEY (idMenu),
	CONSTRAINT FK_Menu FOREIGN KEY (idPemilik)
	REFERENCES Pemilik (idPemilik)
);

create table Stand (
	idStand varchar2(10)
	namaEvent varchar2(25),
	tglEvent date,
	hargaStand integer,
	ukuran integer,
	alamat varchar2(50),
	idPStand varchar2(10),

	CONSTRAINT PK_Stand PRIMARY KEY (idStand),
	CONSTRAINT FK_Menu FOREIGN KEY (idPemilik)
	REFERENCES PenyediaStand (idPStand)
);

create table Barang (
	idBarang varchar2(10),
	namaBarang varchar2(25),
	hargaBarang integer,
	jumBarang integer,
	idSupplier varchar2(10),

	CONSTRAINT PK_Barang PRIMARY KEY (idBarang),
	CONSTRAINT FK_Barang FOREIGN KEY (idSupplier)
	REFERENCES Supplier (idSupplier)
);

create table Bahan (
	idBahan varchar2(10),
	namaBahan varchar2(25),
	hargaBahan integer,
	jumBahan integer,
	idSupplier varchar2(10),

	CONSTRAINT PK_Bahan PRIMARY KEY (idBahan),
	CONSTRAINT FK_Bahan FOREIGN KEY (idSupplier)
	REFERENCES Supplier (idSupplier)
);

create table RMemesan (
	noPesanan varchar2(10),
	tglPesanan date,
	jumPesanan integer,
	idPelanggan varchar2(10),
	idMenu varchar2(10),

	CONSTRAINT PK_RMemesan PRIMARY KEY (noPesanan),
	CONSTRAINT FK_RMemesan FOREIGN KEY (idPelanggan)
	REFERENCES Pelanggan (idPelanggan),
	CONSTRAINT FK_RMemesan FOREIGN KEY (idMenu)
	REFERENCES Menu (idMenu)
);

insert into Pemilik (idPemilik, namaPemilik, kontakPemilik)
values (0000000000, Jojo Tarigan, 081313215737);

insert into Menu (idMenu, namaMenu, hargaMenu)
values (M01, Espresso, 18000);

insert into Menu (idMenu, namaMenu, hargaMenu)
values (M02, Cafe Latte, 18000);

insert into Menu (idMenu, namaMenu, hargaMenu)
values(M03, Cappucino, 20000);

insert into Menu (idMenu, namaMenu, hargaMenu)
values (M04, V60, 21000);

insert into Menu (idMenu, namaMenu, hargaMenu);
values (M05, Mochacino, 20000);

insert into Menu (idMenu, namaMenu, hargaMenu)
values (M06, Pink Pelvet, 21000);

Select idMenu, namaMenu, hargaMenu
FROM Menu;