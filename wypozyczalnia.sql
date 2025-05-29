-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Maj 13, 2025 at 03:18 PM
-- Wersja serwera: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204
-- Wersja PHP: 8.1.16

START TRANSACTION;

--
-- Database: "wypozyczalnia"
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli "Klienci"
--

CREATE TABLE "Klienci" (
  "pesel" varchar(11) NOT NULL,
  "imie" varchar(50) DEFAULT NULL,
  "nazwisko" varchar(50) DEFAULT NULL,
  "adres" varchar(100) DEFAULT NULL,
  "numer_telefonu" varchar(20) DEFAULT NULL,
  "email" varchar(100) DEFAULT NULL
);

--
-- Dumping data for table "Klienci"
--

INSERT INTO "Klienci" ("pesel", "imie", "nazwisko", "adres", "numer_telefonu", "email") VALUES
('02270413414', 'Andrii', 'wda', 'wda', '231413221', 'dawd@dssfa'),
('02270416781', 'Andrii', 'Solianyk', 'Staffa 23', '893879136', 'zdarova@gmail.com'),
('02312121223', 'Łukasz', 'Tomczyk', 'Gnieiwicin', '444555666', 'mail@mail.com'),
('02312808023', 'lukasz', 'tomczyk', 'gniewiecin', '555666777', 'aga@com.pl'),
('12345678910', 'Mateusz', 'Grot', 'Dzierąznia', '123456789', 'grot.smierdziel@gmail.com'),
('73070134567', 'Jan', 'Pilec', 'ul Zagorska 32 Kielce', '584432983', 'johnpilec@wp.pl'),
('88050645678', 'Marek', 'Gorzala', 'ul Sandomierska 55 Kielce', '584532934', 'margor@onet.pl'),
('89121523456', 'Karol', 'Golec', 'ul Armii Krajowej 6 Kielce', '721293544', 'kgolec@interia.pl'),
('94010212345', 'Artur', 'Nowak', 'ul Warszawska 7 Kielce', '676888253', 'arturito3@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli "Samochody"
--

CREATE TABLE "Samochody" (
  "SamochodID" SERIAL,
  "Marka" varchar(50) DEFAULT NULL,
  "Model" varchar(50) DEFAULT NULL,
  "RokProdukcji" integer DEFAULT NULL,
  "CenaDzienna" decimal(10,2) DEFAULT NULL,
  "Dostepnosc" varchar(3) DEFAULT NULL
);

--
-- Dumping data for table "Samochody"
--

INSERT INTO "Samochody" ("SamochodID", "Marka", "Model", "RokProdukcji", "CenaDzienna", "Dostepnosc") VALUES
(1, 'Toyota', 'Yaris Cross', 2021, 200.00, 'Tak'),
(2, 'Audi', 'A3', 2016, 550.00, 'Tak'),
(3, 'Peugeot', '4008', 2018, 400.00, 'Tak'),
(4, 'Opel', 'Astra', 2015, 300.00, 'Tak'),
(5, 'Opel', 'Insignia', 2016, 350.00, 'Tak'),
(6, 'Skoda', 'Fabia', 2016, 250.00, 'Tak');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli "Wypozyczenia"
--

CREATE TABLE "Wypozyczenia" (
  "WypozyczenieID" SERIAL,
  "SamochodID" integer DEFAULT NULL,
  "pesel" varchar(11) DEFAULT NULL,
  "DataWypozyczenia" date DEFAULT NULL,
  "DataZwrotu" date DEFAULT NULL,
  "KosztWypozyczenia" decimal(10,2) DEFAULT NULL
);

--
-- Dumping data for table "Wypozyczenia"
--

INSERT INTO "Wypozyczenia" ("WypozyczenieID", "SamochodID", "pesel", "DataWypozyczenia", "DataZwrotu", "KosztWypozyczenia") VALUES
(1, 3, '94010212345', '2023-11-07', '2023-11-14', 1000.00),
(2, 1, '89121523456', '2023-11-01', '2023-11-13', 2000.00),
(3, 6, '02270413414', '2023-12-01', '2023-12-15', 3500.00),
(18, 3, '02270413414', '2024-01-26', '2024-01-30', 1200.00),
(19, 1, '02270413414', '2024-01-17', '2024-01-27', 5500.00),
(21, 1, '2313123241', '2024-01-04', '2024-01-11', 3850.00),
(55, 1, '02270413414', '2024-01-14', '2024-01-19', 1000.00),
(62, 2, '02312121223', '2024-01-21', '2024-01-24', 1650.00),
(68, 2, '02270413414', '2024-03-12', '2024-03-06', -3300.00);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli "Klienci"
--
ALTER TABLE "Klienci"
  ADD PRIMARY KEY ("pesel");

--
-- Indeksy dla tabeli "Samochody"
--
ALTER TABLE "Samochody"
  ADD PRIMARY KEY ("SamochodID");

--
-- Indeksy dla tabeli "Wypozyczenia"
--
ALTER TABLE "Wypozyczenia"
  ADD PRIMARY KEY ("WypozyczenieID");

CREATE INDEX IF NOT EXISTS "idx_wypozyczenia_samochodid" ON "Wypozyczenia" ("SamochodID");
CREATE INDEX IF NOT EXISTS "idx_wypozyczenia_pesel" ON "Wypozyczenia" ("pesel");


--
-- Constraints for dumped tables
--

--
-- Constraints for table "Wypozyczenia"
--
ALTER TABLE "Wypozyczenia"
  ADD CONSTRAINT "Wypozyczenia_ibfk_1" FOREIGN KEY ("SamochodID") REFERENCES "Samochody" ("SamochodID");
COMMIT;
