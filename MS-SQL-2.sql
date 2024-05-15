CREATE TABLE Ugyfelek (
    UgyfelID INT PRIMARY KEY,
    Nev NVARCHAR(100),
    Cim NVARCHAR(255),
    Telefonszam NVARCHAR(20),
    Email NVARCHAR(100)
);
INSERT INTO Ugyfelek (UgyfelID, Nev, Cim, Telefonszam, Email) VALUES
(1, 'Kiss Gábor', '1117 Budapest, Október 23. utca 6.', '06301234567', 'kiss.gabor@email.com'),
(2, 'Nagy Anna', '1132 Budapest, Váci út 22.', '06307654321', 'nagy.anna@email.com'),
(3, 'Tóth Béla', '1012 Budapest, Hegyalja út 44.', '06301112233', 'toth.bela@email.com'),
(4, 'Szabó Dávid', '1033 Budapest, Flórián tér 5.', '06302223344', 'szabo.david@email.com'),
(5, 'Erdős László', '1024 Budapest, Margit krt 55.', '06303334455', 'erdos.laszlo@email.com'),
(6, 'Varga Mária', '1052 Budapest, Vörösmarty tér 11.', '06304445566', 'varga.maria@email.com'),
(7, 'Horváth István', '1065 Budapest, Nagymező utca 26.', '06305556677', 'horvath.istvan@email.com'),
(8, 'Kovács József', '1077 Budapest, Wesselényi utca 17.', '06306667788', 'kovacs.jozsef@email.com'),
(9, 'Molnár Péter', '1088 Budapest, Krúdy utca 3.', '06307778899', 'molnar.peter@email.com'),
(10, 'Farkas Éva', '1094 Budapest, Tűzoltó utca 37.', '06308889910', 'farkas.eva@email.com'),
(11, 'Balogh Lajos', '1106 Budapest, Kerepesi út 58.', '06309991011', 'balogh.lajos@email.com'),
(12, 'Papp Zoltán', '1118 Budapest, Budaörsi út 111.', '06301010112', 'papp.zoltan@email.com'),
(13, 'Lakatos Csaba', '1124 Budapest, Németvölgyi út 78.', '06301212323', 'lakatos.csaba@email.com'),
(14, 'Jakab István', '1146 Budapest, Thököly út 41.', '06301313434', 'jakab.istvan@email.com'),
(15, 'Németh Erzsébet', '1158 Budapest, Kőrösi út 25.', '06301414545', 'nemeth.erzsebet@email.com'),
(16, 'Szűcs András', '1163 Budapest, Cziráki utca 26.', '06301515656', 'szucs.andras@email.com'),
(17, 'Takács Márton', '1174 Budapest, Pesti út 155.', '06301616767', 'takacs.marton@email.com'),
(18, 'Fehér Katalin', '1181 Budapest, Üllői út 336.', '06301717878', 'feher.katalin@email.com'),
(19, 'Tóth Ágnes', '1193 Budapest, Ady Endre út 122.', '06301818989', 'toth.agnes@email.com'),
(20, 'Kis János', '1204 Budapest, Nagykőrösi út 44.', '06301919090', 'kis.janos@email.com');


CREATE TABLE Kolcsonok (
    KolcsonID INT PRIMARY KEY,
    UgyfelID INT,
    Osszeg MONEY,
    KezdetiDatum DATE,
    LejaratiDatum DATE,
    Kamatlab FLOAT,
    FOREIGN KEY (UgyfelID) REFERENCES Ugyfelek(UgyfelID)
);

INSERT INTO Kolcsonok (KolcsonID, UgyfelID, Osszeg, KezdetiDatum, LejaratiDatum, Kamatlab) VALUES
(1, 1, 500000, '2023-01-15', '2024-01-15', 5.0),
(2, 2, 1500000, '2023-02-20', '2025-02-20', 4.5),
(3, 3, 250000, '2023-03-15', '2023-12-15', 6.0),
(4, 4, 1250000, '2023-04-10', '2024-04-10', 5.5),
(5, 5, 300000, '2023-05-21', '2024-05-20', 6.5),
(6, 1, 800000, '2023-06-11', '2024-06-10', 4.0),
(7, 2, 2000000, '2023-07-30', '2025-07-29', 3.5),
(8, 3, 450000, '2023-08-15', '2024-08-14', 7.0),
(9, 4, 1200000, '2023-09-20', '2025-09-19', 5.0),
(10, 5, 700000, '2023-10-25', '2024-10-24', 6.0),
(11, 6, 500000, '2023-11-15', '2024-11-14', 5.5),
(12, 7, 1500000, '2023-12-05', '2025-12-04', 4.5),
(13, 8, 250000, '2024-01-22', '2024-12-21', 5.0),
(14, 9, 1250000, '2024-02-18', '2025-02-17', 5.0),
(15, 10, 300000, '2024-03-15', '2025-03-14', 6.5),
(16, 11, 800000, '2024-04-10', '2025-04-09', 5.0),
(17, 12, 2000000, '2024-05-20', '2026-05-19', 4.0),
(18, 13, 450000, '2024-06-15', '2025-06-14', 6.0),
(19, 14, 1200000, '2024-07-25', '2026-07-24', 5.5),
(20, 15, 700000, '2024-08-30', '2025-08-29', 6.0);

CREATE TABLE Fizetesek (
    FizetesID INT PRIMARY KEY,
    KolcsonID INT,
    FizetesDatum DATE,
    FizetettOsszeg MONEY,
    FOREIGN KEY (KolcsonID) REFERENCES Kolcsonok(KolcsonID)
);

INSERT INTO Fizetesek (FizetesID, KolcsonID, FizetesDatum, FizetettOsszeg) VALUES
(1, 1, '2023-02-15', 25000),
(2, 1, '2023-03-15', 25000),
(3, 2, '2023-03-20', 75000),
(4, 2, '2023-04-20', 75000),
(5, 3, '2023-04-15', 12500),
(6, 3, '2023-05-15', 12500),
(7, 4, '2023-05-10', 62500),
(8, 4, '2023-06-10', 62500),
(9, 5, '2023-06-21', 15000),
(10, 5, '2023-07-21', 15000),
(11, 6, '2023-07-11', 40000),
(12, 6, '2023-08-11', 40000),
(13, 7, '2023-08-30', 100000),
(14, 7, '2023-09-30', 100000),
(15, 8, '2023-09-15', 22500),
(16, 8, '2023-10-15', 22500),
(17, 9, '2023-10-20', 60000),
(18, 9, '2023-11-20', 60000),
(19, 10, '2023-11-25', 35000),
(20, 10, '2023-12-25', 35000);

CREATE TABLE Hiteltermek (
    TermekID INT PRIMARY KEY,
    TermekNeve NVARCHAR(100),
    MaximalisOsszeg MONEY,
    MinimalisFutamido INT,
    MaximalisFutamido INT,
    AlapKamatlab FLOAT
);

INSERT INTO Hiteltermek (TermekID, TermekNeve, MaximalisOsszeg, MinimalisFutamido, MaximalisFutamido, AlapKamatlab) VALUES
(1, 'Személyi kölcsön', 2000000, 12, 60, 5.0),
(2, 'Jelzáloghitel', 10000000, 60, 240, 3.5),
(3, 'Autóhitel', 5000000, 12, 72, 4.5),
(4, 'Felújítási hitel', 3000000, 12, 60, 5.5),
(5, 'Diákhitel', 800000, 6, 36, 4.0),
(6, 'Fogyasztási hitel', 1500000, 12, 48, 5.2),
(7, 'Gyorskölcsön', 500000, 3, 12, 6.0),
(8, 'Hitelkártya', 300000, 1, 12, 18.0),
(9, 'Lakáshitel', 15000000, 60, 300, 2.9),
(10, 'Beruházási hitel', 20000000, 60, 120, 4.1),
(11, 'Konszolidációs hitel', 5000000, 24, 84, 5.3),
(12, 'Start-up hitel', 8000000, 24, 60, 5.0),
(13, 'Mikrohitel', 200000, 6, 24, 7.0),
(14, 'Agrárhitel', 10000000, 60, 180, 4.0),
(15, 'Exportfinanszírozási hitel', 5000000, 12, 60, 3.0),
(16, 'Zöld hitel', 2500000, 12, 60, 4.2),
(17, 'Túlforgó hitel', 300000, 3, 12, 6.5),
(18, 'Szállítói hitel', 1500000, 12, 48, 5.4),
(19, 'Kereskedelmi hitel', 4500000, 12, 60, 4.5),
(20, 'Szabad felhasználású hitel', 2500000, 12, 48, 4.8);

CREATE TABLE Kolcson_Termek (
    KolcsonID INT,
    TermekID INT,
    PRIMARY KEY (KolcsonID, TermekID),
    FOREIGN KEY (KolcsonID) REFERENCES Kolcsonok(KolcsonID),
    FOREIGN KEY (TermekID) REFERENCES Hiteltermek(TermekID)
);

INSERT INTO Kolcson_Termek (KolcsonID, TermekID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

