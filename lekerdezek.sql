/* 1. Lekérdezés: Kérdezd le azoknak az ügyfeleknek a nevét, a kölcsön összegét és a kölcsön kezdő dátumát, 
akik több mint 1 millió forint értékű kölcsönt vettek fel: */

SELECT U.Nev, K.Osszeg, K.KezdetiDatum
FROM Ugyfelek U
JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID
WHERE K.Osszeg > 1000000;

/* 2. Lekérdezés: Listázd ki minden olyan ügyfél nevét, aki több mint egy kölcsönt vett fel,
továbbá jelenítsd meg a kölcsönök számát és az átlagos kölcsönösszeget az adott ügyfélre vonatkozóan. 
Az eredményeket rendezd az átlagos kölcsönösszeg szerint csökkenő sorrendben: */

SELECT U.Nev, COUNT(K.KolcsonID) AS KolcsonSzam, AVG(K.Osszeg) AS AtlagOsszeg
FROM Ugyfelek U
JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID
GROUP BY U.Nev
HAVING COUNT(K.KolcsonID) > 1
ORDER BY AtlagOsszeg DESC;

/* 3. Lekérdezés: Készíts egy SQL lekérdezést, amely az ügyfelek nevét, 
a kölcsönök kezdő évét csoportosítja, és listázza a kölcsönök számát és átlagos összegét évenként. 
Alkalmazz ROLLUP funkciót az ügyfél nevére és a kölcsönök kezdő évére. A lekérdezésnek csak azokat az eseteket kell megjelenítenie, 
ahol az átlagos kölcsönösszeg meghaladja az 1,000,000 forintot. Az eredményeket rendezd az ügyfél neve és az év szerint: */

SELECT U.Nev, YEAR(K.KezdetiDatum) AS Ev, COUNT(K.KolcsonID) AS KolcsonSzam, AVG(K.Osszeg) AS AtlagOsszeg
FROM Ugyfelek U
JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID
GROUP BY ROLLUP(U.Nev, YEAR(K.KezdetiDatum))
HAVING AVG(K.Osszeg) > 1000000
ORDER BY U.Nev, Ev;

/* 4. Lekérdezés: Készíts egy lekérdezést, amely az ügyfelek nevét, a kölcsön összegét, a kezdő 
dátumát és a kumulatív kölcsönösszeget jeleníti meg. Az adatokat az ügyfél neve szerint 
csoportosítsd a kezdő dátum szerinti sorrendben: */

SELECT U.Nev, K.Osszeg, K.KezdetiDatum,
       SUM(K.Osszeg) OVER (PARTITION BY U.Nev ORDER BY K.KezdetiDatum RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS KumulativOsszeg
FROM Ugyfelek U
JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID;

/* 5. Lekérdezés: Írj egy SQL lekérdezést, amely beágyazott lekérdezést használ az ügyfelek, a kölcsönök,
a kölcsön-termék kapcsolatok és a hiteltermékek táblák adatainak lekérdezésére. Az eredménynek tartalmaznia
kell azokat az ügyfeleket, akik olyan hitelterméket vettek igénybe, melynek maximális összege meghaladja az 5 millió forintot: */

SELECT U.Nev, K.Osszeg, T.TermekNeve
FROM Ugyfelek U
JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID
JOIN Kolcson_Termek KT ON K.KolcsonID = KT.KolcsonID
JOIN Hiteltermek T ON KT.TermekID = T.TermekID
WHERE T.TermekNeve IN (SELECT TermekNeve FROM Hiteltermek WHERE MaximalisOsszeg > 5000000);


/* 6. Lekérdezés: Hozz létre egy eljárást, amely paraméterként kap egy ügyfél azonosítót, és visszaadja az adott ügyfél nevét, a felvett kölcsönök összegét, 
kezdő dátumát és a kapcsolódó hiteltermék nevét. Az eljárás az ügyfelek, kölcsönök, kölcsön-termék kapcsolatok és hiteltermékek táblák adatait használja fel: */

CREATE PROCEDURE GetUgyfelKolcsonInfo (@UgyfelID INT)
AS
BEGIN
    SELECT U.Nev, K.Osszeg, K.KezdetiDatum, T.TermekNeve
    FROM Ugyfelek U
    JOIN Kolcsonok K ON U.UgyfelID = K.UgyfelID
    JOIN Kolcson_Termek KT ON K.KolcsonID = KT.KolcsonID
    JOIN Hiteltermek T ON KT.TermekID = T.TermekID
    WHERE U.UgyfelID = @UgyfelID;
END;
