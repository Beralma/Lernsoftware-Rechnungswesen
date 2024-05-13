USE master;
GO

IF DB_ID(N'hausarbeit') IS NULL
  CREATE DATABASE hausarbeit;
GO

USE hausarbeit;
GO 

IF OBJECT_ID('Kapitel') IS NOT NULL
  DROP TABLE Kapitel;
GO

IF OBJECT_ID('Inhalt') IS NOT NULL
  DROP TABLE Inhalt;
GO

IF OBJECT_ID('Aufgabenstellung') IS NOT NULL
  DROP TABLE Aufgabenstellung;
GO

IF OBJECT_ID('Rueckmeldung') IS NOT NULL
  DROP TABLE Rueckmeldung;
GO

CREATE TABLE Kapitel (
  Kapitel_id INT IDENTITY PRIMARY KEY, 
  Kapitel_Name nvarchar(100) not null,
);

CREATE TABLE Inhalt (
  Inhalt_id INT IDENTITY PRIMARY KEY, 
  Kapitel_id int not null,
  Inhalt_Text nvarchar(999) not null,
);

CREATE TABLE Aufgabenstellung (
  AGS_id INT IDENTITY PRIMARY KEY, 
  Kapitel_id int not null,
  inhalt_id int not null,
  AGS_Text nvarchar(999) not null,
);

CREATE TABLE Rueckmeldung (
  Rueck_id INT IDENTITY PRIMARY KEY, 
  Rueck_Text nvarchar(999) not null,
);