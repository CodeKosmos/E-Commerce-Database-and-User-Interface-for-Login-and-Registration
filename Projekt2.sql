-- Löscht die Datenbank "Projekt2" falls sie existiert.
DROP DATABASE IF EXISTS Projekt2;

-- Erstellt die Datenbank "Projekt2".
CREATE DATABASE Projekt2;

-- Wählt die Datenbank "Projekt2" zur Nutzung aus.
USE Projekt2;

-- Erstellt die Tabelle "Kunde".
CREATE TABLE Kunde(
  kunde_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  vorname varchar(50) NOT NULL, -- Vorname des Kunden.
  nachname varchar(50) NOT NULL, -- Nachname des Kunden.
  geburtsdatum date DEFAULT NULL, -- Geburtsdatum des Kunden.
  PRIMARY KEY (kunde_id) -- Primärschlüssel auf "kunde_id".
);

-- Fügt Datensätze in die Tabelle "Kunde" ein.
INSERT INTO Kunde VALUES (1,'John','hund','2003-03-03');
INSERT INTO Kunde VALUES (2,'Maria','Becker','2010-05-05');
INSERT INTO Kunde VALUES (3,'Stefan','kkkk','2000-04-04');
INSERT INTO Kunde VALUES (10,'Stefan','test','2000-09-08');

-- Erstellt die Tabelle "Kundenkonto".
CREATE TABLE Kundenkonto (
  kundenkonto_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  name varchar(50) NOT NULL, -- Name des Kundenkontos.
  addresse varchar(50) NOT NULL, -- Adresse des Kundenkontos.
  Email varchar(50) NOT NULL, -- E-Mail des Kundenkontos.
  kunde_id int NOT NULL, -- Fremdschlüssel auf "Kunde".
  PRIMARY KEY (kundenkonto_id), -- Primärschlüssel auf "kundenkonto_id".
  FOREIGN KEY (kunde_id) REFERENCES Kunde(kunde_id) -- Fremdschlüsselverweis auf "kunde_id" der Tabelle "Kunde".
);

-- Fügt Datensätze in die Tabelle "Kundenkonto" ein.
INSERT INTO Kundenkonto VALUES (1,'John19','str1','john@gmail.com',1);
INSERT INTO Kundenkonto VALUES (2,'Maria22','str3','maria@gmail.com',2);
INSERT INTO Kundenkonto VALUES (3,'Stefan32','str9','stefan@gmail.com',3);
INSERT INTO Kundenkonto VALUES (10,'Stefan4','str12','stefan4@gmail.com',10);

-- Erstellt die Tabelle "TopFlopListe".
CREATE TABLE TopFlopListe (
  topFlopListe_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  name varchar(50) NOT NULL, -- Name der Liste.
  PRIMARY KEY (topFlopListe_id) -- Primärschlüssel auf "topFlopListe_id".
);

-- Fügt Datensätze in die Tabelle "TopFlopListe" ein.
INSERT INTO TopFlopListe VALUES (1,'liste1');
INSERT INTO TopFlopListe VALUES (2,'liste2');

-- Erstellt die Tabelle "Warenkorb".
CREATE TABLE Warenkorb(
  warenkorb_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  anzahl_produkte int NOT NULL, -- Anzahl der Produkte im Warenkorb.
  PRIMARY KEY (warenkorb_id) -- Primärschlüssel auf "warenkorb_id".
);

-- Fügt Datensätze in die Tabelle "Warenkorb" ein.
INSERT INTO Warenkorb VALUES (1,1);
INSERT INTO Warenkorb VALUES (2,5);

-- Erstellt die Tabelle "Bestellung".
CREATE TABLE Bestellung (
  bestellung_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  type varchar(50) NOT NULL, -- Typ der Bestellung.
  warenkorb_id int NOT NULL, -- Fremdschlüssel auf "Warenkorb".
  datum datetime NOT NULL, -- Datum der Bestellung.
  PRIMARY KEY (bestellung_id), -- Primärschlüssel auf "bestellung_id".
  FOREIGN KEY (warenkorb_id) REFERENCES Warenkorb(warenkorb_id) -- Fremdschlüsselverweis auf "warenkorb_id" der Tabelle "Warenkorb".
);

-- Fügt Datensätze in die Tabelle "Bestellung" ein.
INSERT INTO Bestellung VALUES (1,'Handy',1,'2021-01-09');
INSERT INTO Bestellung VALUES (2,'tv',2,'2021-11-01');
INSERT INTO Bestellung VALUES (3,'tv',2,'2021-11-01');

-- Erstellt die Tabelle "KundeBeantragtBestellung".
CREATE TABLE KundeBeantragtBestellung (
  bestellung_id int NOT NULL, -- Fremdschlüssel auf "Bestellung".
  kundenkonto_id int NOT NULL, -- Fremdschlüssel auf "Kundenkonto".
  FOREIGN KEY (bestellung_id) REFERENCES Bestellung(bestellung_id), -- Fremdschlüsselverweis auf "bestellung_id" der Tabelle "Bestellung".
  FOREIGN KEY (kundenkonto_id) REFERENCES Kundenkonto(kundenkonto_id) -- Fremdschlüsselverweis auf "kundenkonto_id" der Tabelle "Kundenkonto".
);

-- Fügt Datensätze in die Tabelle "KundeBeantragtBestellung" ein.
INSERT INTO KundeBeantragtBestellung VALUES (1,3);
INSERT INTO KundeBeantragtBestellung VALUES (2,1);

-- Erstellt die Tabelle "Produkte".
CREATE TABLE Produkte (
  produkt_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  name varchar(50) NOT NULL, -- Name des Produkts.
  menge_auf_Lager int NOT NULL, -- Menge des Produkts auf Lager.
  preis decimal(8,2) NOT NULL, -- Preis des Produkts.
  bewertung varchar(50) NOT NULL, -- Bewertung des Produkts.
  verkaufspreis decimal(8,3) NOT NULL, -- Verkaufspreis des Produkts.
  handler varchar(50) NOT NULL, -- Händler des Produkts.
  topFlopListe_id int NOT NULL, -- Fremdschlüssel auf "TopFlopListe".
  bestellung_id int NOT NULL, -- Fremdschlüssel auf "Bestellung".
  PRIMARY KEY (produkt_id), -- Primärschlüssel auf "produkt_id".
  FOREIGN KEY (topFlopListe_id) REFERENCES TopFlopListe(topFlopListe_id) -- Fremdschlüsselverweis auf "topFlopListe_id" der Tabelle "TopFlopListe".
);

-- Fügt Datensätze in die Tabelle "Produkte" ein.
INSERT INTO Produkte VALUES (1,'Iphone 12 pro max',70,1217.5,'GUT',1389.0,'APPLE',1,1);
INSERT INTO Produkte VALUES (2,'ASUS LAPTOP',10,602.99,'GUT',602.99,'ASUS',1,2);
INSERT INTO Produkte VALUES (3,'SAMSUNG TV 65zoll',2,500.99,'SCHLECHT',500.99,'SAMSUNG',1,1);
INSERT INTO Produkte VALUES (4,'HERD',15,320.74,'SCHLECHT',350,'SIEMENS',1,1);
INSERT INTO Produkte VALUES (5,'Lautsprecher JBL',100,71.09,'GUT',111.09,'JBL',1,1);
INSERT INTO Produkte VALUES (6,'Iphone 7',6,689.5,'SEHR GUT',699,'APPLE',1,1);

-- Erstellt die Tabelle "Produktinbestellung".
CREATE TABLE Produktinbestellung (
  bestellung int NOT NULL, -- Fremdschlüssel auf "Bestellung".
  produkt int NOT NULL, -- Fremdschlüssel auf "Produkte".
  menge int DEFAULT NULL, -- Menge des Produkts in der Bestellung.
  FOREIGN KEY (bestellung) REFERENCES Bestellung(bestellung_id), -- Fremdschlüsselverweis auf "bestellung_id" der Tabelle "Bestellung".
  FOREIGN KEY (produkt) REFERENCES Produkte(produkt_id) -- Fremdschlüsselverweis auf "produkt_id" der Tabelle "Produkte".
);

-- Fügt Datensätze in die Tabelle "Produktinbestellung" ein.
INSERT INTO Produktinbestellung VALUES (1, 1, 5);

-- Erstellt die Tabelle "Produktwahl".
CREATE TABLE Produktwahl (
  produkt int NOT NULL, -- Fremdschlüssel auf "Produkte".
  konto int NOT NULL, -- Fremdschlüssel auf "Kundenkonto".
  FOREIGN KEY (produkt) REFERENCES Produkte(produkt_id), -- Fremdschlüsselverweis auf "produkt_id" der Tabelle "Produkte".
  FOREIGN KEY (konto) REFERENCES Kundenkonto(Kundenkonto_id) -- Fremdschlüsselverweis auf "kundenkonto_id" der Tabelle "Kundenkonto".
);

-- Fügt Datensätze in die Tabelle "Produktwahl" ein.
INSERT INTO Produktwahl VALUES (1,2);

-- Erstellt die Tabelle "Kontobewertetprodukt".
CREATE TABLE Kontobewertetprodukt (
  produkt int NOT NULL, -- Fremdschlüssel auf "Produkte".
  konto int NOT NULL, -- Fremdschlüssel auf "Kundenkonto".
  bewertung int UNSIGNED NOT NULL, -- Bewertung des Produkts durch das Kundenkonto.
  FOREIGN KEY (produkt) REFERENCES Produkte(produkt_id), -- Fremdschlüsselverweis auf "produkt_id" der Tabelle "Produkte".
  FOREIGN KEY (konto) REFERENCES Kundenkonto(kundenkonto_id) -- Fremdschlüsselverweis auf "kundenkonto_id" der Tabelle "Kundenkonto".
);

-- Fügt Datensätze in die Tabelle "Kontobewertetprodukt" ein.
INSERT INTO Kontobewertetprodukt VALUES ('2','1','0');
INSERT INTO Kontobewertetprodukt VALUES ('5','2','2');
INSERT INTO Kontobewertetprodukt VALUES ('6','1','3');
INSERT INTO Kontobewertetprodukt VALUES ('1','2','4');

-- Erstellt die Tabelle "Produkcategorie".
CREATE TABLE Produkcategorie (
  produkcategorie_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  type varchar(50) NOT NULL, -- Typ der Kategorie.
  PRIMARY KEY (produkcategorie_id) -- Primärschlüssel auf "produkcategorie_id".
);

-- Fügt Datensätze in die Tabelle "Produkcategorie" ein.
INSERT INTO Produkcategorie VALUES (1,'Technologie');
INSERT INTO Produkcategorie VALUES (2,'küche');

-- Erstellt die Tabelle "ProdukIncategorie".
CREATE TABLE ProdukIncategorie (
  produkt int NOT NULL, -- Fremdschlüssel auf "Produkte".
  produkcategorie int NOT NULL, -- Fremdschlüssel auf "Produkcategorie".
  FOREIGN KEY (produkt) REFERENCES Produkte(produkt_id), -- Fremdschlüsselverweis auf "produkt_id" der Tabelle "Produkte".
  FOREIGN KEY (produkcategorie) REFERENCES Produkcategorie(produkcategorie_id) -- Fremdschlüsselverweis auf "produkcategorie_id" der Tabelle "Produkcategorie".
);

-- Fügt Datensätze in die Tabelle "ProdukIncategorie" ein.
INSERT INTO ProdukIncategorie VALUES (1,1);
INSERT INTO ProdukIncategorie VALUES (2,1);
INSERT INTO ProdukIncategorie VALUES (3,1);
INSERT INTO ProdukIncategorie VALUES (4,2);

-- Erstellt die Tabelle "Bezahlung".
CREATE TABLE Bezahlung (
  bezahlung_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  betrag decimal NOT NULL, -- Betrag der Bezahlung.
  nummer int(11) NOT NULL, -- Nummer der Bezahlung.
  art varchar(50) NOT NULL, -- Art der Bezahlung.
  datum datetime NOT NULL, -- Datum der Bezahlung.
  PRIMARY KEY (bezahlung_id) -- Primärschlüssel auf "bezahlung_id".
);

-- Fügt Datensätze in die Tabelle "Bezahlung" ein.
INSERT INTO bezahlung VALUES (1, '27.5', '5', 'Master card', '2020-08-02 10:18:39');

-- Erstellt die Tabelle "BezahlungVonBestellung".
CREATE TABLE BezahlungVonBestellung (
  bezahlung int NOT NULL, -- Fremdschlüssel auf "Bezahlung".
  bestellung int NOT NULL, -- Fremdschlüssel auf "Bestellung".
  FOREIGN KEY (bezahlung) REFERENCES Bezahlung(bezahlung_id), -- Fremdschlüsselverweis auf "bezahlung_id" der Tabelle "Bezahlung".
  FOREIGN KEY (bestellung) REFERENCES Bestellung(bestellung_id) -- Fremdschlüsselverweis auf "bestellung_id" der Tabelle "Bestellung".
);

-- Fügt Datensätze in die Tabelle "BezahlungVonBestellung" ein.
INSERT INTO BezahlungVonBestellung VALUES (1,1);
-- INSERT INTO BezahlungVonBestellung VALUES (2,2); -- Kommentierte Einfügeanweisung.

-- Erstellt die Tabelle "Sendung".
CREATE TABLE Sendung (
  sendung_id int NOT NULL, -- Primärschlüsselspalte.
  bezahlung_id int NOT NULL, -- Fremdschlüssel auf "Bezahlung".
  status int DEFAULT NULL, -- Status der Sendung.
  nummer int NOT NULL, -- Nummer der Sendung.
  FOREIGN KEY (bezahlung_id) REFERENCES Bezahlung(bezahlung_id) -- Fremdschlüsselverweis auf "bezahlung_id" der Tabelle "Bezahlung".
);

-- Fügt Datensätze in die Tabelle "Sendung" ein.
INSERT INTO Sendung VALUES (1, 1, 1, 1);
INSERT INTO Sendung VALUES (2, 1, 0, 2);

-- Erstellt die Tabelle "ruecksendung".
CREATE TABLE ruecksendung (
  ruecksendung_id int NOT NULL, -- Primärschlüsselspalte.
  datum datetime NOT NULL, -- Datum der Rücksendung.
  nummer int NOT NULL, -- Nummer der Rücksendung.
  menge int NOT NULL, -- Menge der rückgesendeten Produkte.
  erstattet varchar(50) NOT NULL, -- Erstattungsstatus.
  PRIMARY KEY (ruecksendung_id) -- Primärschlüssel auf "ruecksendung_id".
);

-- Fügt Datensätze in die Tabelle "ruecksendung" ein.
INSERT INTO ruecksendung VALUES (1, '2021-09-25 16:24:15', 1, 5, '80');

-- Erstellt die Tabelle "kontobeantragtruecksendung".
CREATE TABLE kontobeantragtruecksendung (
  ruecksendung int NOT NULL, -- Fremdschlüssel auf "ruecksendung".
  kundenkonto int NOT NULL, -- Fremdschlüssel auf "Kundenkonto".
  FOREIGN KEY (ruecksendung) REFERENCES ruecksendung(ruecksendung_id), -- Fremdschlüsselverweis auf "ruecksendung_id" der Tabelle "ruecksendung".
  FOREIGN KEY (kundenkonto) REFERENCES Kundenkonto(kundenkonto_id) -- Fremdschlüsselverweis auf "kundenkonto_id" der Tabelle "Kundenkonto".
);

-- Erstellt die Tabelle "Umsatz_auf_ort".
CREATE TABLE Umsatz_auf_ort (
  ort_id int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  bundesland varchar(50) NOT NULL, -- Bundesland.
  stadt varchar(50) NOT NULL, -- Stadt.
  gemeinde varchar(50) NOT NULL, -- Gemeinde.
  PRIMARY KEY (ort_id) -- Primärschlüssel auf "ort_id".
);

-- Fügt Datensätze in die Tabelle "Umsatz_auf_ort" ein.
INSERT INTO Umsatz_auf_ort VALUES (1,'Rheinland-Pfalz','Koblenz','karthause');
INSERT INTO Umsatz_auf_ort VALUES (2,'Baden-württemberg','Stuttgart','Bad Cannstatt');
INSERT INTO Umsatz_auf_ort VALUES (3,'Rheinland-Pfalz','MAINZ','Bad1');
INSERT INTO Umsatz_auf_ort VALUES (4,'Rheinland-Pfalz','MAINZ','Bad2');
INSERT INTO Umsatz_auf_ort VALUES (5,'Rheinland-Pfalz','MAINZ','Bad3');

-- Erstellt die Tabelle "SortierungVonUmsaetze".
CREATE TABLE SortierungVonUmsaetze (
  Umsatz_auf_ort int NOT NULL AUTO_INCREMENT, -- Automatisch inkrementierte Primärschlüsselspalte.
  bestellung int NOT NULL, -- Fremdschlüssel auf "Bestellung".
  FOREIGN KEY (Umsatz_auf_ort) REFERENCES Umsatz_auf_ort(ort_id), -- Fremdschlüsselverweis auf "ort_id" der Tabelle "Umsatz_auf_ort".
  FOREIGN KEY (bestellung) REFERENCES Bestellung(bestellung_id) -- Fremdschlüsselverweis auf "bestellung_id" der Tabelle "Bestellung".
);

-- Fügt Datensätze in die Tabelle "SortierungVonUmsaetze" ein.
INSERT INTO SortierungVonUmsaetze VALUES (1, 1); 
INSERT INTO SortierungVonUmsaetze VALUES (2, 2);
