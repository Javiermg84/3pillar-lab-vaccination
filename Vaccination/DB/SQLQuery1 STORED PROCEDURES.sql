USE vaccination2
GO


-- Table : States
----Create Fake Data with INSERT INTO

INSERT INTO State (Name) VALUES ('Sonora');
INSERT INTO State (Name) VALUES ('Chihuahua');
INSERT INTO State (Name) VALUES ('Tamaulipas');
GO

----Create Fake Data with STORED PROCEDURE

CREATE PROCEDURE SP_InsertState
    @Name varchar(30)
    AS BEGIN
       INSERT [dbo].[State] ([Name]) 
       VALUES (@Name);
  END
  GO

EXECUTE SP_InsertState 'Veracruz';
EXECUTE SP_InsertState 'Jalisco';
EXECUTE SP_InsertState 'Nayarit';
GO

select * from State
GO




--Table : [Personnel Key] 

----Create Fake Data with INSERT INTO

INSERT INTO [Personnel key] ([idPersonnel key],Name) VALUES (1,'Paramedic');
INSERT INTO [Personnel key] ([idPersonnel key],Name) VALUES (2,'Nurse');
GO

CREATE PROCEDURE SP_InsertPersKey
      @'idPersonnel Key' tinyint, @Name varchar(30)
    AS BEGIN
       INSERT INTO [dbo].[Personnel key] ([idPersonnel key],Name) 
       VALUES (@'[idPersonnel Key]', @Name);
  END
  GO -- NO FUNCIONO

  EXECUTE SP_InsertPersKey [2],[Nurse];
  GO

  select * from [Personnel key]
  GO




--Table : Vaccine 

----Create Fake Data with INSERT INTO

INSERT INTO Vaccine (Name, Dose) VALUES ('Pfizer','2');
INSERT INTO Vaccine (Name, Dose) VALUES ('AstraZeneca','2');
GO

----Create Fake Data with STORED PROCEDURE

CREATE PROCEDURE SP_InserVaccine
    @Name varchar(50), @Dose varchar(30)
    AS BEGIN
       INSERT [dbo].[Vaccine] ([Name],[Dose])
       VALUES (@Name,@Dose);
  END
  GO

EXECUTE SP_InserVaccine [Jhonson&Jhonson],[1];
EXECUTE SP_InserVaccine 'Cansino','2';
EXECUTE SP_InserVaccine 'Sputnik','2';
GO

SELECT * FROM Vaccine
GO



--Table : Campus

----Create Fake Data with INSERT INTO

INSERT INTO Campus (Address, Date, idState) VALUES ('Blvd. Garcia Morales 276','05/05/2020','1');
INSERT INTO Campus (Address, Date, idState) VALUES ('C. Juan Aldama 502','09/15/2020','2');
INSERT INTO Campus (Address, Date, idState) VALUES ('C. Fco Javier Mina 706','10/05/2021','3');
GO

----Create Fake Data with STORED PROCEDURE

CREATE PROCEDURE SP_InsertCampus
    @Address varchar(100),@Date smalldatetime,@idState tinyint
    AS BEGIN
       INSERT [dbo].[Campus] ([Address],[Date],[idState]) 
       VALUES (@Address,@Date,@idState);
  END
  GO

EXECUTE SP_InsertCampus 'C. Cabo Blanco 7','05/10/2020','13';
EXECUTE SP_InsertCampus 'C. Independencia 295','06/18/2021','14';
EXECUTE SP_InsertCampus 'C. Zacatecas 87','01/10/2020','16';
GO

SELECT * FROM Campus
GO



--Table : Personnel

----Create Fake Data with INSERT INTO
INSERT INTO Personnel VALUES ('Juan','Perez','Rodriguez','Olivares 24','5658542589',1,3);
INSERT INTO Personnel VALUES ('Margarita','Sotelo','Garcia','Colon 45','8456985821',2,3);
INSERT INTO Personnel VALUES ('Julia','Salvador','Gonzalez','B. Juarez 367','8574715263',1,33);
INSERT INTO Personnel VALUES ('Roberto','Calderon','Flores','Colosio 78','8785485219',2,33);
INSERT INTO Personnel VALUES ('Armida','Tapia','Almada','Solidaridad 56','2150525287',1,35);
INSERT INTO Personnel VALUES ('Manuel','Lopez','Uriarte','justo sierra 34','8485748596',2,35);
INSERT INTO Personnel VALUES ('Luis','Lopez','Molina','Jose M Morelos 876','1025414256',1,43);
INSERT INTO Personnel VALUES ('Jorge','Mazon','Rivera','Jacinto cota 45','8757474585',2,43);
INSERT INTO Personnel VALUES ('Laura','Tapia','Lopez','Londres 678','5263965854',1,45);
INSERT INTO Personnel VALUES ('Alejandra','Moreno','Rodriguez','Navarrete 896','4875125634',2,45);
INSERT INTO Personnel VALUES ('Ivan','Perez','Santiago','Caturegli 869','9897548563',1,49);
INSERT INTO Personnel VALUES ('Roberto','Garcia','Madrigal','Mendoza 546','5462315463',2,49);
GO

----Create Fake Data with STORED PROCEDURE

CREATE PROCEDURE SP_InsertPersonnel
    (@Name varchar(30), @[Maternal surname] varchar(100), @[Paternal surname] varchar(100), @Address varchar(100), @[Telefone number] varchar(10), @[idPersonnel key] tinyint, @idCampus tinyint)
	AS BEGIN
       INSERT [dbo].[Personnel] ([Name],[Maternal surname],[Paternal surname],[Address],[Telephone number],[idPersonnel key],[idCampus]) 
       VALUES (@Name, @[Maternal surname], @[Paternal surname], @Address, @[Telephone number], @[idPersonnel key], @idCampus);
	END
	GO  -- NO FUNCIONO ESTA MADRE

EXECUTE SP_InsertPersonnel
GO

SELECT * FROM Personnel
GO




--Table : Citizen

----Create Fake Data with INSERT INTO
INSERT INTO Citizen VALUES ('Joaquin','Guzman','Loera','Sierra Madre 01','5848596584',55,3,1);
INSERT INTO Citizen VALUES ('Arnoldo','Perez','Sotelo','B. Juarez 56','6528547855',45,3,2);
INSERT INTO Citizen VALUES ('Martin','Salazar','Vallarta','Colosio 47','6354215467',42,33,6);
INSERT INTO Citizen VALUES ('Carmen','Gutierrez','Alvarez','Quirogua 38','5643543543',21,33,6);
INSERT INTO Citizen VALUES ('Lidia','Rivera','Antunez','Navarrete 89','8975644213',29,35,1);
INSERT INTO Citizen VALUES ('Andrea','Madrid','Perez','Rebeico 998','2134135469',34,35,6);
INSERT INTO Citizen VALUES ('Lizeth','Alvarez','Lopez','Lopez del castillo 64','8975643212',46,43,2);
INSERT INTO Citizen VALUES ('Jorge','Rodriguez','Tapia','Londres 87','8976546432',50,43,2);
INSERT INTO Citizen VALUES ('Arturo','Antunez','Molina','Madrigal 23','2113454448',26,45,7);
INSERT INTO Citizen VALUES ('Julian','Velazquez','Rivera','Solidaridad 376','6423247557',35,45,7);
INSERT INTO Citizen VALUES ('Ivan','Gallardo','Salazar','Obrador 56','2131255645',54,49,8);
INSERT INTO Citizen VALUES ('Diego','Gonzalez','Perez','Ebrard 78','5216534955',22,49,6);
GO


SELECT * FROM Citizen 

DELETE FROM Citizen WHERE idCitizen > 12
GO




--Table : Citizen Report

----Create Fake Data with INSERT INTO

INSERT INTO [Citizen report] VALUES (1,3,1,1,'05/05/20')
INSERT INTO [Citizen report] VALUES (2,3,2,2,'05/05/20')
INSERT INTO [Citizen report] VALUES (3,33,6,1,'09/15/20')
INSERT INTO [Citizen report] VALUES (4,33,6,1,'09/15/20')
INSERT INTO [Citizen report] VALUES (5,35,1,1,'10/05/21')
INSERT INTO [Citizen report] VALUES (6,35,6,1,'10/05/21')
INSERT INTO [Citizen report] VALUES (7,43,2,2,'05/10/20')
INSERT INTO [Citizen report] VALUES (8,43,2,1,'05/10/20')
INSERT INTO [Citizen report] VALUES (9,45,7,1,'06/18/21')
INSERT INTO [Citizen report] VALUES (10,45,7,2,'06/18/21')
INSERT INTO [Citizen report] VALUES (11,49,8,2,'01/10/20')
INSERT INTO [Citizen report] VALUES (12,49,6,1,'01/10/20')
GO

SELECT * FROM [Citizen report]