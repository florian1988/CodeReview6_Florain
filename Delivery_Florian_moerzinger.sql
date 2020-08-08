create database Delivery_Florian_Moerzinger default character set utf8;


create table Mailbox (
	Id_Mailbox int Auto_increment, Primary key(Id_Mailbox),
	Address Varchar (50)
);

create table Post_Partner(
	Id_Post_Partner int Auto_increment, Primary key(Id_Post_Partner),
	Name Varchar (30),
	Address Varchar (50),
	Tel_Number int (20)
);


create table Postman(
	Id_Postman int Auto_increment, Primary key(Id_Postman),
	Name Varchar (40),
	Tel_Number int (20),
	Date_of_Birth Date
);

create table District(
	Id_District int Auto_increment, Primary key(Id_District),
	ZIP int(5),
	Name Varchar(50),
	Fk_Postman int,
	foreign key(Fk_Postman) references Postman(Id_Postman)
);


create table People(
	Id_People int Auto_increment, Primary key(Id_People),
	First_Name Varchar(20),
	Last_Name Varchar(20),
	ZIP int(5),
	Address Varchar(50)
);

create table Letter_Package(
	Id_Letter_Package int Auto_increment, Primary key(Id_Letter_Package),
	Send_Date Date,
	Fk_Sender int,
	Fk_Recipient int,
	foreign key(Fk_Sender) references People(Id_People),
	foreign key(Fk_Recipient) references People(Id_People)
);


create table Incomming_Mail(
	Id_Incomming_Mail int Auto_increment, Primary key(Id_Incomming_Mail),
	Express_Delivery boolean,
	Incomming_Date Date,
	Fk_Letter int,
	foreign key(Fk_Letter) references Letter_Package(Id_Letter_Package)
);

create table Outcommig_Mail(
	Id_Outcomming_Mail int Auto_increment, Primary key(Id_Outcomming_Mail),
	Outcomming_Date Date,
	Fk_Letter int,
	foreign key(Fk_Letter) references Letter_Package(Id_Letter_Package)
);

create table Deliver_Office(
	Id_Delivery_Office int Auto_increment, Primary key(Id_Delivery_Office),
	Address Varchar(50),
	Tel_Number Int(20)
);


create table Post_Office(
	Id_Post_Office int Auto_increment, Primary key(Id_Post_Office),
	Address Varchar (50),
	Tel_Number int (20),
	FK_Incomming_Mail int,
	Fk_Mailbox int,
	Fk_Post_Partner int,
	foreign key(FK_Incomming_Mail) references Incomming_Mail(Id_Incomming_Mail),
	foreign key(Fk_Mailbox) references Mailbox(Id_Mailbox),
	foreign key(Fk_Post_Partner) references Post_Partner(Id_Post_Partner)
);


create table To_Deliver(
	Id_To_Deliver int Auto_increment, Primary key(Id_To_Deliver),
	Fk_Outcomming_Mail int,
	Fk_Delivery_Office int, 
	foreign key (Fk_Outcomming_Mail) references Outcommig_Mail(Id_Outcomming_Mail),
	foreign key ( Fk_Delivery_Office) references Deliver_Office(Id_Delivery_Office)
);


create table District_List(
	Id_District_List int Auto_increment, Primary key(Id_District_List),
	Fk_Delivery_Office int,
	Fk_District int,
	foreign key (Fk_Delivery_Office) references Deliver_Office(Id_Delivery_Office),
	foreign key (Fk_District) references District(Id_District)
);

create table Post_Center(
Id_Post_Center int Auto_increment, Primary key(Id_Post_Center),
Address Varchar (50),
Tel_Number int (20),
Country Varchar(30)
);

create table Post_Center_Delivery(
	Id_Post_Center_Delivery int Auto_increment, Primary key(Id_Post_Center_Delivery),
	Fk_Post_Center int,
	Fk_Post_Office int,
	Fk_Delivery_Office int,
	Fk_Letter int,
	foreign key(Fk_Post_Center) references Post_Center(Id_Post_Center),
	foreign key(Fk_Post_Office) references Post_Office(Id_Post_Office),
	foreign key(Fk_Delivery_Office) references Deliver_Office(Id_Delivery_Office),
	foreign key(Fk_Letter) references Letter_Package(Id_Letter_Package)
);


insert into Mailbox (Address)
	values
	("Große Gasse 34"),
	("Kleine Gasse 24"),
	("Keine Gasse 14");

insert into Post_Partner (Name, Address, Tel_Number)
	values
	( "Der Gerät", "März Straße 2", 0664102030),
	("schneien Haare und Post", "Ottakringer Straße 50", 0650784512),
	("Tankstelle Horst", "OverseeStraße 140", 0650326598);


insert into Postman (Name, Tel_Number, Date_of_Birth)
	values
	("Herbert Hobiger", 0650251463, 1970-12-21),
	("Ignatz Engelbert", 0664794613, 1980-02-02),
	("Siegfried Enzel", 0664718293, 1990-06-06);


insert into District ( ZIP, Name, Fk_Postman)
	values
	(3652, "Hinterwurzen", 1),
	(3640, "Staubfresser", 2),
	(3670, "Bergowe", 3);

insert into People (First_Name, Last_Name, ZIP, Address)
	values
	("Herbert", "Hobiger", 3652, "Keller Gasse 34"),
	("Anton", "Fichtenhuber", 3652, "Keller Gasse 2"),
	("Engelbert", "Fleichhauer", 3640, "Stadtplatz 45"),
	("Maria", "Pfaffenbacher", 3640, "Heustadelweg 33"),
	("Gustl", "Erwacht", 3670, "Inder Gasse 4"),
	("Meindl", "Hattan", 3670, "Farbstift 90");

insert into Letter_Package ( Send_Date, Fk_Sender, Fk_Recipient)
	values
	(2020-08-01, 1,6),
	(2020-08-02, 2,5),
	(2020-08-02, 5,3);

insert into Incomming_Mail( Express_Delivery, Incomming_Date, Fk_Letter)
	values
	(true, 2020-08-02, 1),
	(false, 2020-08-02,2),
	(false, 2020-08-03,3);


insert into Outcommig_Mail(Outcomming_Date, Fk_Letter)
	values
	(2020-08-03,1),
	(2020-08-06,2),
	(2020-08-07,3);

insert into Deliver_Office( Address, Tel_Number)
	values
	("Backstein 34", 0664001245),
	("Backhausen 2", 0676852147);

insert into To_Deliver(Fk_Outcomming_Mail, Fk_Delivery_Office)
	values
	(1,1),
	(2,2),
	(3,2);


insert into District_List(Fk_Delivery_Office , Fk_District)
	values
	(1, 3),
	(2, 2),
	(2, 1);



insert into Post_Office(Address, Tel_Number, FK_Incomming_Mail, Fk_Mailbox, Fk_Post_Partner)
	values
	("Leise Gasse 12", 0664781829, 1, 2, 2),
	("Hintere Gasse 1", 0664785974, 2, 1, 1),
	("Graue Straße 34", 0650461524, 3, 3, 3);


insert into Post_Center(Address, Tel_Number, Country)
	values
	("Hauptstraße 1", 06644448254, "Niederösterreich");


insert into Post_Center_Delivery(Fk_Post_Center, Fk_Post_Office, Fk_Delivery_Office, Fk_Letter )
	values
	(1, 1, 2, 1),
	(1, 2, 1, 2),
	(1, 3, 1, 3);









select Mailbox.Address, Post_Partner.Name, Post_Office.Address, Post_Center_Delivery.Id_Post_Center_Delivery
from Post_Center_Delivery
inner join Post_Office
on Post_Center_Delivery.Fk_Post_Office = Post_Office.Id_Post_Office
right join Post_Partner
on Post_Office.Fk_Post_Partner = Post_Partner.Id_Post_Partner
right join Mailbox
on Post_Office.Fk_Mailbox = Mailbox.Id_Mailbox