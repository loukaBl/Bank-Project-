create database BankProject
use BankProject

-- Create Tables 

CREATE TABLE AGENCE(  
    NumAg INT PRIMARY KEY,
    NomAg VARCHAR(40), 
    AdrAg VARCHAR(100), 
    TelAg INT, 
    CaAg NUMERIC(10), 
    DateCreatAg DATE
); 

CREATE TABLE CLIENT( 
    NumCl INT PRIMARY KEY,
    NomCl VARCHAR(20), 
    AdrCl VARCHAR(100), 
    TelCl INT
); 

CREATE TABLE EMPLOYE( 
    NumEmp INT PRIMARY KEY,
    NomEmp VARCHAR(20), 
    SalBasEmp NUMERIC(12, 3), 
    DateEmb DATE, 
    Fonct VARCHAR(40), 
    ComSal NUMERIC(12, 3), 
    DirectEmp INT, 
    NumAg INT,
    FOREIGN KEY (DirectEmp) REFERENCES EMPLOYE(NumEmp),
    FOREIGN KEY (NumAg) REFERENCES AGENCE(NumAg)
);


CREATE TABLE COMPTE( 
    NumCpt INT PRIMARY KEY,
    NumCl INT NOT NULL,
    SoldeCpt NUMERIC(12, 3), 
    NumAg INT NOT NULL,
    TypCpt VARCHAR(30),
    FOREIGN KEY (NumCl) REFERENCES CLIENT(NumCl),
    FOREIGN KEY (NumAg) REFERENCES AGENCE(NumAg)
); 

CREATE TABLE OPERATION( 
    NumCpt INT NOT NULL,
    DateOp DATE NOT NULL,
    TypOp VARCHAR(40), 
    MntOp NUMERIC(12, 3), 
    NumEmp INT,
    PRIMARY KEY (NumCpt, DateOp),
    FOREIGN KEY (NumCpt) REFERENCES COMPTE(NumCpt),
    FOREIGN KEY (NumEmp) REFERENCES EMPLOYE(NumEmp)
); 

CREATE TABLE PRET( 
    NumPret INT PRIMARY KEY,
    NumCpt INT NOT NULL,
    NbMois INT, 
    MntPret NUMERIC(12, 3), 
    TxPret NUMERIC(4, 2), 
    DatePret DATE,
    FOREIGN KEY (NumCpt) REFERENCES COMPTE(NumCpt)
); 

CREATE TABLE TRANCHE( 
    NumPret INT NOT NULL,
    Echeance DATE NOT NULL,
    MntTr NUMERIC(12, 3),
    PRIMARY KEY (NumPret, Echeance),
    FOREIGN KEY (NumPret) REFERENCES PRET(NumPret)
);

select * from AGENCE
select * from CLIENT
select * from EMPLOYE
select * from OPERATION
select * from PRET
select * from TRANCHE
select * from TRANCHE



-- Insert Data into AGENCE

INSERT INTO AGENCE(NumAg, NomAg, AdrAg, TelAg, CaAg, DateCreatAg) VALUES
(10, 'BIAT GREMDA', 'Route Gremda km1, Sfax', 74123456, 10000000, '2010-01-01'),
(20, 'BIAT EL HABIB', 'Cité El Habib km 4, Sfax', 74456789, 50000000, '2010-04-01'),
(30, 'BIAT HABIB THAMEUR', 'Avenue Habib Thameur Km 5, Sfax', 74147258, 60000000, '2011-01-01'),
(40, 'BIAT LAFRANE', 'Agence Sfax route Lafrane km 7', 74147259, 70000000, '2012-07-01'),
(50, 'BIAT LASSKA', 'Agence Abdelhamid Lasska, Sousse', 73123456, 10000000, '2012-08-01'),
(60, 'BIAT MHAMED EL KHAMES', '8 Avenue Mhamed El Khames, Sousse', 73456789, 50000000, '2013-09-01'),
(70, 'BIAT EL MARSA', 'Agence Tunis El Marsa km 1.5', 71147258, 60000000, '2014-01-01'),
(80, 'BIAT EL MANAR', 'Agence Tunis El Manar km 2', 71147259, 70000000, '2014-01-01'),
(90, 'BIAT EL MEDINA', 'Agence Tunis El Medina km 4.5', 71147259, 70000000, '2015-01-01'),
(100, 'BIAT EL MEDINA2', 'Agence Tunis El Medina km 4.5', 71147259, 70000000, '2017-01-01');

-- Table EMPLOYE
INSERT INTO EMPLOYE (NumEmp, NomEmp, SalBasEmp, DateEmb, Fonct, ComSal, DirectEmp, NumAg)
VALUES (7000, 'Ahmed Ezdine', 3000, '2008-01-01', 'Chef Agence', NULL, NULL, 10);
INSERT INTO EMPLOYE (NumEmp, NomEmp, SalBasEmp, DateEmb, Fonct, ComSal, DirectEmp, NumAg)
VALUES (7001, 'Hazem Guemri', 2100, '2009-03-12', 'Responsable Commercial', 500, 7000, 10);
INSERT INTO EMPLOYE (NumEmp, NomEmp, SalBasEmp, DateEmb, Fonct, ComSal, DirectEmp, NumAg)
VALUES (7002, 'Aymen Louati', 1200, '2008-02-10', 'Caissier', NULL, 7001, 10);
INSERT INTO EMPLOYE (NumEmp, NomEmp, SalBasEmp, DateEmb, Fonct, ComSal, DirectEmp, NumAg)
VALUES (7003, 'Haithem Mallek', 1000, '2010-04-12', 'Caissier', NULL, 7001, 10);
INSERT INTO EMPLOYE (NumEmp, NomEmp, SalBasEmp, DateEmb, Fonct, ComSal, DirectEmp, NumAg)
VALUES (7008, 'Molka Chtourou', 1000, '2010-04-12', 'Caissier', NULL, 7001, 10);

-- Table CLIENT
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (1, 'Mohamed Ali', 'Route gremda km1, Sfax', 74100256);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (2, 'Salah Ben Mabrouk', 'Route gremda km2, Sfax', 74100257);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (3, 'Ali Ben Salah', 'Route gremda km3, Sfax', 74100258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (4, 'Zied Ben Mbarek', 'Route ali belhouane km1, Sousse', 73100258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (5, 'Amina Ben Khlif', 'Route khaznadar km2, Sousse', 73100250);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (6, 'Wiem Ben Awicha', 'Rue Hedi Nouira Tunis', 71108258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (7, 'Mokhtar Ben Lateif', 'Complexe Postal Ariana, Avenue Habib Bourguiba Tunis', 71990258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (8, 'Mohamed Ben Hsin', 'Rue Malaga - 2092 El Manar I Tunis', 71177258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (9, 'Mohamed Ali', 'Rue aéroport km 4, Sfax', 74177258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (10, 'Mohamed Ben Mohamed', 'Rue Malaga - 2092 El Manar I Tunis', 71177258);
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl)
VALUES (11, 'Mohamed Mohamed', 'Rue Carthage km 4, Tunis', 74177258);

-- Table COMPTE
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (100, 1, 100, 5522, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (200, 1, 10, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (300, 2, 10, -30, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (400, 2, 10, 400, 'Etudiant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (500, 4, 50, 2500, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (600, 4, 50, 6000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (700, 5, 50, -600, 'Courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (800, 6, 80, -999, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (900, 6, 80, 60, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (1000, 7, 80, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (1001, 8, 80, 650, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (1002, 9, 10, 6500, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (1003, 10, 100, 650, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (1004, 11, 100, 6500, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10003, 1, 20, 5522, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10004, 1, 30, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10005, 1, 40, 5522, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10006, 1, 50, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10007, 1, 60, 5522, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10008, 1, 70, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10009, 1, 80, 5522, 'courant');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10010, 1, 90, 20000, 'Epargne');
INSERT INTO COMPTE (NumCpt, NumCl, NumAg, SoldeCpt, TypCpt)
VALUES (10011, 2, 90, 20000, 'Epargne');

-- Table OPERATION
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2013-01-01 14:30:50', 'virement espèce', 1000, 7003);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2013-01-09 11:50:21', 'virement espèce', 500, 7008);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2013-02-01 15:20:30', 'frais abonnement', -25, 7000);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2014-01-01 10:20:30', 'agios', -18, 7000);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2014-01-09 19:20:30', 'tva', -35, 7000);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2015-02-24 18:20:30', 'virement salaire', 1200, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2015-02-02 18:20:30', 'retrait', -100, 7008);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2015-10-20 14:50:20', 'retrait', -200, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2015-10-24 14:50:20', 'virement salaire', 1200, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (100, '2015-10-20 11:30:20', 'virement espèce', 2000, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2013-01-01 11:20:30', 'virement', 10200, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2013-01-09 16:20:30', 'virement', 10000, 7003);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2014-02-01 15:20:30', 'retrait', -500, 7008);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2014-10-20 11:20:30', 'virement', 500, 7002);
INSERT INTO OPERATION (NumCpt, DateOp, TypOp, MntOp, NumEmp) VALUES (200, '2015-02-02 11:20:30', 'retrait', -200, 7003);

-- Table PRET
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (500, 100, 24, 12000, 8.5, '2018-07-12'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (501, 100, 4, 3000, 6.5, '2013-03-24'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (502, 100, 3, 1000, 5.5, '2011-02-01'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (601, 200, 36, 12000, 8.5, '2017-09-12'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (600, 200, 5, 2000, 6.5, '2013-09-12'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (400, 300, 18, 36000, 8.5, '2017-11-17'); 
INSERT INTO PRET (NumPret, NumCpt, NbMois, MntPret, TxPret, DatePret) 
VALUES (401, 500, 24, 72000, 8.5, '2017-11-23'); 

-- Table TRANCHE
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (502, '2009-02-28', 351.667); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (502, '2009-03-28', 351.667); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (502, '2009-04-28', 351.667); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (500, '2016-08-24', 542.5); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (500, '2016-09-24', 542.5); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (500, '2016-10-24', 542.5); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (501, '2011-04-26', 798.75); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (501, '2011-05-26', 798.75); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (501, '2011-06-26', 798.75); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (501, '2011-07-26', 798.75); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (600, '2011-10-25', 426); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (600, '2011-11-25', 426); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (600, '2011-12-25', 426); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (600, '2011-01-25', 426); 
INSERT INTO TRANCHE (NumPret, Echeance, MntTr) 
VALUES (600, '2012-02-25', 426); 

--Part 1: DDL
--1. Add NOT NULL constraints to critical business columns(NomAg, NomCl, DateEmb) and modify the telephone data type to support international formats(VARCHAR(15)).

alter table AGENCE alter column NomAg VARCHAR(40) not null;

alter table CLIENT alter column NomCl  VARCHAR(20) not null;


alter table EMPLOYE alter column  DateEmb DATE not null;

alter table CLIENT alter column TelCl VARCHAR(15);
alter table AGENCE alter column TelAg  VARCHAR(15);

exec sp_help 'AGENCE'
exec sp_help 'CLIENT'

--2. Add CHECK constraints to ensure data quality: ensure positive salaries(SalBasEmp), and validate that loan interest rates(TxPret) are reasonable business rates between 1% and 20%.

alter table EMPLOYE add constraint c1 check (SalBasEmp > 0);

alter table PRET add constraint c2 check (TxPret between 1 and 20);


--3.Add new columns to to CLIENT table: Email (VARCHAR(100))/ DateInscription (DATE) with default = today /Statut (VARCHAR(20)) with check: 'Actif', 'Inactif', 'Bloqué' and default = 'Actif'
alter table CLIENT add Email VARCHAR(100),DateInscription date default getdate() ,Statut VARCHAR(20) DEFAULT 'Actif' CHECK (Statut IN ('Actif', 'Inactif', 'Bloqué'));


--5. Create indexes on frequently searched columns to improve query performance: CLIENT(NomCl), COMPTE(SoldeCpt) and OPERATION(DateOp) 

create index INDEX_CLIENT_NomCl
on CLIENT (NomCl);


create index INDX_COMPTE_SoldeCpt
on COMPTE (SoldeCpt);

create index INDX_OPERATION_DateOp
on OPERATION (DateOp);



--6. Create a view called VW_Clients_Comptes that shows a comprehensive overview of clients and their accounts by joining three tables
/*
The view should display: Client number and name / Client telephone / Account number and type / Account balance / Agency name where the account is held
*/

create view VW_Clients_Comptes as
select c.NumCl ,c.NomCl ,c.TelCl ,cp.NumCpt ,cp.SoldeCpt  ,a.NomAg ,cp.TypCpt
from CLIENT c join COMPTE cp on c.NumCl=cp.NumCl
join AGENCE a on a.NumAg=cp.NumAg

select * 
from VW_Clients_Comptes

--Part 2: DML
/* 1. Add New Client: 
Insert a new client with the following details:
       * Client Number: 12
       * Name: 'Sara Ben Ahmed'
       * Address: 'Rue de la République, Sfax'
       * Telephone: 74111222
       * Email: 'sara.ahmed@email.com'
       * Status: 'Actif' (use default for registration date)

*/
-- 1. Add New Client
INSERT INTO CLIENT (NumCl, NomCl, AdrCl, TelCl, Email, Statut)
VALUES (12, 'Sara Ben Ahmed', 'Rue de la République,Sfax', 74111222, 'sara.ahmed@email.com','Actif');

select * 
from CLIENT

--2. Give a 10% salary increase to all employees working at agency number 10 (BIAT GREMDA)

update EMPLOYE
set SalBasEmp = SalBasEmp * 1.10
where NumAg = 10;



--3. Update the balance of account 300 to remove the negative balance by setting it to zero 
update COMPTE
set SoldeCpt =0
where NumCpt=300


 ----Part 3: DQL
 -- Basic SELECT
--1. List all agencies in Sfax
select *
from AGENCE
where AdrAg like '%Sfax%'
--2. Find clients with phone numbers starting with 74 
select  *   
from CLIENT
where TelCl  like '74%'
--3. Show accounts with negative balances
select *
from COMPTE
where SoldeCpt<0;
--4. Find employees earning between 1000 and 2000
select *
from EMPLOYE
where SalBasEmp BETWEEN 1000 AND 2000;

--5. Show loans with amount > 10000 OR interest rate < 7%
select *
from PRET
where MntPret > 10000 OR TxPret < 7



--6. Find clients NOT living in Sousse

select *
from CLIENT
where AdrCl not like '%Sousse%'
--7.Show operations with amounts between -100 and 1000
select*
from OPERATION
where MntOp between -100 and 1000

--ORDER BY Clause
--8. List employees by highest salary first
select *
from EMPLOYE
order by SalBasEmp desc
--9. Show clients alphabetically by name
select*
from CLIENT
order by NomCl asc
--10. Display accounts by balance (lowest to highest)
select *
from COMPTE
order by SoldeCpt asc
--11. Show agencies by creation date (oldest first)
select * 
from AGENCE
order by DateCreatAg asc
--12. List operations by date (most recent first) and amount
select*
from OPERATION
order by DateOp ,MntOp  asc



--GROUP BY
--13. Count number of accounts per agency
select NomAg ,count(NumAg ) as number_of_accounts
from AGENCE
group by NomAg
--14. Total balance by account type
select NumCl ,sum(SoldeCpt )asTotal_balance
from COMPTE
group by NumCl



--15. Average salary by function
select NomEmp  ,avg(SalBasEmp )as avg_salary
from EMPLOYE
group by NomEmp 
--16. Number of operations per employee


--17. Total loan amount per account
select Numpret,sum(MntPret )
from pret
group by Numpret

--JOIN Operations

--18. Show client names  with their accounts

SELECT cl.NomCl, cp.NumCpt
FROM CLIENT cl
INNER JOIN COMPTE cp ON cl.NumCl = cp.NumCl;

--19. Show All client names and their accounts (even if no account)

SELECT cl.NomCl, cp.NumCpt
FROM CLIENT cl
LEFT JOIN COMPTE cp ON cl.NumCl = cp.NumCl;

--20. Show All accounts and their client info

SELECT cp.NumCpt, cp.TypCpt, cp.SoldeCpt, cl.NomCl, cl.TelCl
FROM COMPTE cp
INNER JOIN CLIENT cl ON cp.NumCl = cl.NumCl;

--21. List Employees with their agency names

SELECT emp.NomEmp, emp.Fonct, emp.SalBasEmp, ag.NomAg
FROM EMPLOYE emp
INNER JOIN AGENCE ag ON emp.NumAg = ag.NumAg;

--21. Find All Agencies and Their Employees (Including Agencies with No Employees)

SELECT ag.NomAg, emp.NomEmp
FROM AGENCE ag
LEFT JOIN EMPLOYE emp ON ag.NumAg = emp.NumAg;

--22. Show Operations with employee names

SELECT op.*, emp.NomEmp
FROM OPERATION op
INNER JOIN EMPLOYE emp ON op.NumEmp = emp.NumEmp;

--23. Show Loans with account and client info

SELECT pr.*, cp.TypCpt, cl.NomCl
FROM PRET pr
INNER JOIN COMPTE cp ON pr.NumCpt = cp.NumCpt
INNER JOIN CLIENT cl ON cp.NumCl = cl.NumCl;

--24. Show Operations along with client and employee info

SELECT op.*, cl.NomCl, emp.NomEmp
FROM OPERATION op
INNER JOIN COMPTE cp ON op.NumCpt = cp.NumCpt
INNER JOIN CLIENT cl ON cp.NumCl = cl.NumCl
INNER JOIN EMPLOYE emp ON op.NumEmp = emp.NumEmp;

--25. Find All clients and all accounts (cross join)

SELECT cl.NomCl, cp.NumCpt
FROM CLIENT cl
CROSS JOIN COMPTE cp;

--26. Show All possible agency-employee combinations (cross join)

SELECT ag.NomAg, emp.NomEmp
FROM AGENCE ag
CROSS JOIN EMPLOYE emp;

--27. Find the employee who earns the highest salary in the entire bank. Display their name, salary, and function (using subquery)

SELECT NomEmp, SalBasEmp, Fonct
FROM EMPLOYE
WHERE SalBasEmp = (SELECT MAX(SalBasEmp) FROM EMPLOYE);

--28. Find all clients who have accounts at agencies located in Sfax. Display client name and telephone (using subquery)

SELECT cl.NomCl, cl.TelCl
FROM CLIENT cl
WHERE cl.NumCl IN (
    SELECT cp.NumCl
    FROM COMPTE cp
    WHERE cp.NumAg IN (
        SELECT ag.NumAg
        FROM AGENCE ag
        WHERE ag.AdrAg LIKE '%Sfax%'
    )
);
