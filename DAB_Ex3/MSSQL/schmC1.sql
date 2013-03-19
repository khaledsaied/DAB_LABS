--
-- Target: Microsoft SQL Server 
-- Syntax: isql /Uuser /Ppassword /Sserver -i\path\filename.sql
-- Date  : Mar 19 2013 22:50
-- Script Generated by Database Design Studio 2.21.3 
--


--
-- Create Table    : 'Virksomhed'   
-- VirksomhedID    :  
--
CREATE TABLE Virksomhed (
    VirksomhedID   CHAR(1) NOT NULL,
CONSTRAINT pk_Virksomhed PRIMARY KEY CLUSTERED (VirksomhedID))
GO

--
-- Create Table    : 'Ansat'   
-- AnsatID         :  
-- VirksomhedID    :  (references Virksomhed.VirksomhedID)
--
CREATE TABLE Ansat (
    AnsatID        CHAR(1) NOT NULL,
    VirksomhedID   CHAR(1) NULL,
CONSTRAINT pk_Ansat PRIMARY KEY CLUSTERED (AnsatID),
CONSTRAINT fk_Ansat FOREIGN KEY (VirksomhedID)
    REFERENCES Virksomhed (VirksomhedID)
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Direktoer'   
-- AnsatID         :  (references Ansat.AnsatID)
-- DirektoerID     :  
--
CREATE TABLE Direktoer (
    AnsatID        CHAR(1) NOT NULL,
    DirektoerID    CHAR(1) NOT NULL,
CONSTRAINT pk_Direktoer PRIMARY KEY CLUSTERED (AnsatID,DirektoerID),
CONSTRAINT fk_Direktoer FOREIGN KEY (AnsatID)
    REFERENCES Ansat (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Ingenioer'   
-- AnsatID         :  (references Ansat.AnsatID)
-- IngenioerID     :  
--
CREATE TABLE Ingenioer (
    AnsatID        CHAR(1) NOT NULL,
    IngenioerID    CHAR(1) NOT NULL,
CONSTRAINT pk_Ingenioer PRIMARY KEY CLUSTERED (AnsatID),
CONSTRAINT fk_Ingenioer FOREIGN KEY (AnsatID)
    REFERENCES Ansat (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Diplomingenioer'   
-- AnsatID         :  (references Ingenioer.AnsatID)
-- DiplomingenioerID :  
--
CREATE TABLE Diplomingenioer (
    AnsatID        CHAR(1) NOT NULL,
    DiplomingenioerID CHAR(1) NOT NULL,
CONSTRAINT pk_Diplomingenioer PRIMARY KEY CLUSTERED (AnsatID,DiplomingenioerID),
CONSTRAINT fk_Diplomingenioer FOREIGN KEY (AnsatID)
    REFERENCES Ingenioer (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Civilingenioer'   
-- AnsatID         :  (references Ingenioer.AnsatID)
-- CivilingenioerID :  
--
CREATE TABLE Civilingenioer (
    AnsatID        CHAR(1) NOT NULL,
    CivilingenioerID CHAR(1) NOT NULL,
CONSTRAINT pk_Civilingenioer PRIMARY KEY CLUSTERED (AnsatID,CivilingenioerID),
CONSTRAINT fk_Civilingenioer FOREIGN KEY (AnsatID)
    REFERENCES Ingenioer (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Ansaettelsesforhold'   
-- AnsaettelsesforholdID :  
-- VirksomhedID    :  (references Virksomhed.VirksomhedID)
-- AnsatID         :  (references Ansat.AnsatID)
--
CREATE TABLE Ansaettelsesforhold (
    AnsaettelsesforholdID CHAR(1) NOT NULL,
    VirksomhedID   CHAR(1) NULL,
    AnsatID        CHAR(1) NULL,
CONSTRAINT pk_Ansaettelsesforhold PRIMARY KEY CLUSTERED (AnsaettelsesforholdID),
CONSTRAINT fk_Ansaettelsesforhold FOREIGN KEY (VirksomhedID)
    REFERENCES Virksomhed (VirksomhedID)
    ON UPDATE CASCADE,
CONSTRAINT fk_Ansaettelsesforhold2 FOREIGN KEY (AnsatID)
    REFERENCES Ansat (AnsatID)
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Timeloen'   
-- AnsaettelsesforholdID :  (references Ansaettelsesforhold.AnsaettelsesforholdID)
-- TimeloenID      :  
--
CREATE TABLE Timeloen (
    AnsaettelsesforholdID CHAR(1) NOT NULL,
    TimeloenID     CHAR(1) NOT NULL,
CONSTRAINT pk_Timeloen PRIMARY KEY CLUSTERED (AnsaettelsesforholdID,TimeloenID),
CONSTRAINT fk_Timeloen FOREIGN KEY (AnsaettelsesforholdID)
    REFERENCES Ansaettelsesforhold (AnsaettelsesforholdID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Fastansaettelse'   
-- AnsaettelsesforholdID :  (references Ansaettelsesforhold.AnsaettelsesforholdID)
-- FastansaettelseID :  
--
CREATE TABLE Fastansaettelse (
    AnsaettelsesforholdID CHAR(1) NOT NULL,
    FastansaettelseID CHAR(1) NOT NULL,
CONSTRAINT pk_Fastansaettelse PRIMARY KEY CLUSTERED (AnsaettelsesforholdID,FastansaettelseID),
CONSTRAINT fk_Fastansaettelse FOREIGN KEY (AnsaettelsesforholdID)
    REFERENCES Ansaettelsesforhold (AnsaettelsesforholdID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Sekretaer'   
-- AnsatID         :  (references Ansat.AnsatID)
-- SekretaerID     :  
--
CREATE TABLE Sekretaer (
    AnsatID        CHAR(1) NOT NULL,
    SekretaerID    CHAR(1) NOT NULL,
CONSTRAINT pk_Sekretaer PRIMARY KEY CLUSTERED (AnsatID,SekretaerID),
CONSTRAINT fk_Sekretaer FOREIGN KEY (AnsatID)
    REFERENCES Ansat (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Tekniker'   
-- AnsatID         :  (references Ansat.AnsatID)
-- TeknikerID      :  
--
CREATE TABLE Tekniker (
    AnsatID        CHAR(1) NOT NULL,
    TeknikerID     CHAR(1) NOT NULL,
CONSTRAINT pk_Tekniker PRIMARY KEY CLUSTERED (AnsatID,TeknikerID),
CONSTRAINT fk_Tekniker FOREIGN KEY (AnsatID)
    REFERENCES Ansat (AnsatID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Firmabil'   
-- FirmaBilID      :  
-- AnsatID         :  (references Direktoer.AnsatID)
-- DirektoerID     :  (references Direktoer.DirektoerID)
--
CREATE TABLE Firmabil (
    FirmaBilID     CHAR(1) NOT NULL,
    AnsatID        CHAR(1) NULL,
    DirektoerID    CHAR(1) NULL,
CONSTRAINT pk_Firmabil PRIMARY KEY CLUSTERED (FirmaBilID),
CONSTRAINT fk_Firmabil FOREIGN KEY (AnsatID,DirektoerID)
    REFERENCES Direktoer (AnsatID,DirektoerID)
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Projektleder'   
-- AnsatID         :  (references Diplomingenioer.AnsatID)
-- AnsatID1        :  (references Civilingenioer.AnsatID)
-- DiplomingenioerID :  (references Diplomingenioer.DiplomingenioerID)
-- CivilingenioerID :  (references Civilingenioer.CivilingenioerID)
-- ProjektlederID  :  
--
CREATE TABLE Projektleder (
    AnsatID        CHAR(1) NOT NULL,
    AnsatID1       CHAR(1) NOT NULL,
    DiplomingenioerID CHAR(1) NOT NULL,
    CivilingenioerID CHAR(1) NOT NULL,
    ProjektlederID CHAR(1) NOT NULL,
CONSTRAINT pk_Projektleder PRIMARY KEY CLUSTERED (AnsatID,AnsatID1,DiplomingenioerID,CivilingenioerID),
CONSTRAINT fk_Projektleder FOREIGN KEY (AnsatID,DiplomingenioerID)
    REFERENCES Diplomingenioer (AnsatID,DiplomingenioerID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
CONSTRAINT fk_Projektleder2 FOREIGN KEY (AnsatID1,CivilingenioerID)
    REFERENCES Civilingenioer (AnsatID,CivilingenioerID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
GO

--
-- Create Table    : 'Fagforening'   
-- FagforeningID   :  
-- AnsaettelsesforholdID :  (references Timeloen.AnsaettelsesforholdID)
-- TimeloenID      :  (references Timeloen.TimeloenID)
--
CREATE TABLE Fagforening (
    FagforeningID  CHAR(1) NOT NULL,
    AnsaettelsesforholdID CHAR(1) NULL,
    TimeloenID     CHAR(1) NULL,
CONSTRAINT pk_Fagforening PRIMARY KEY CLUSTERED (FagforeningID),
CONSTRAINT fk_Fagforening FOREIGN KEY (AnsaettelsesforholdID,TimeloenID)
    REFERENCES Timeloen (AnsaettelsesforholdID,TimeloenID)
    ON UPDATE CASCADE)
GO

--
-- Permissions for: 'public'
--
GRANT ALL ON Virksomhed TO public
GO
GRANT ALL ON Ansat TO public
GO
GRANT ALL ON Direktoer TO public
GO
GRANT ALL ON Ingenioer TO public
GO
GRANT ALL ON Diplomingenioer TO public
GO
GRANT ALL ON Civilingenioer TO public
GO
GRANT ALL ON Ansaettelsesforhold TO public
GO
GRANT ALL ON Timeloen TO public
GO
GRANT ALL ON Fastansaettelse TO public
GO
GRANT ALL ON Sekretaer TO public
GO
GRANT ALL ON Tekniker TO public
GO
GRANT ALL ON Firmabil TO public
GO
GRANT ALL ON Projektleder TO public
GO
GRANT ALL ON Fagforening TO public
GO

