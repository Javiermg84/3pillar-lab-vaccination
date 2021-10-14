 create database vaccination2
 GO

USE vaccination2
GO

CREATE TABLE State
(
    idState tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(30)NOT NULL,
);


CREATE TABLE [Personnel key] 
(
    [idPersonnel key] tinyint PRIMARY KEY NOT NULL,
	Name varchar(30) NOT NULL, 
);


CREATE TABLE Vaccine
(
    idVaccine tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name varchar(50) NOT NULL,
	Dose varchar(30) NOT NULL,
);


CREATE TABLE Campus
(
    idCampus tinyint IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Address varchar(100) NOT NULL,
	Date smalldatetime NOT NULL,
	idState tinyint,
	FOREIGN KEY (idState) references State(idState),
);


CREATE TABLE Personnel 
(
    idPersonnel int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    Address  varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
    [idPersonnel key] tinyint,
	FOREIGN KEY ([idPersonnel key]) references [Personnel key]([idPersonnel key]),
	idCampus tinyint,
	FOREIGN KEY(idCampus) references Campus(idCampus),
	
);

    
CREATE TABLE Citizen
(
    idCitizen int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name varchar(30) NOT NULL,
    [Maternal surname] varchar(100) NOT NULL,
    [Paternal surname] varchar(100) NOT NULL,
    Address varchar(100)NOT NULL,
	[Telephone number] varchar(10) NOT NULL,
	Age tinyint NOT NULL,
	idCampus tinyint,
	FOREIGN KEY(idCampus) references Campus(idCampus),
	idVaccine tinyint,
	FOREIGN KEY(idVaccine) references Vaccine(idVaccine),
);



CREATE TABLE [Citizen report] 
(
    idReport int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idCitizen int
	FOREIGN KEY(idCitizen) references Citizen(idCitizen),
	idCampus tinyint
	FOREIGN KEY(idCampus) references Campus(idCampus),
	idVaccine tinyint
	FOREIGN KEY(idVaccine) references Vaccine(idVaccine),
	[Dose number] tinyint,
	[Vaccination date] smalldatetime NOT NULL,
); 

