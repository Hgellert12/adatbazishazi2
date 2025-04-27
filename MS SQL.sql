CREATE TABLE maszkolt
(
Login_maszk nvarchar(100) masked with (Function = 'default()'),
Email_maszk nvarchar(100) masked with (function = 'email()'),
nev_maszk nvarchar(100) masked with (function = 'default()'),
szulev_maszk INT masked WITH (function = 'random(1,2025)'),
Nem nvarchar(100),
cim_maszk NVARCHAR(100) masked WITH (function = 'partial(1,"XXX",2)'),
)


INSERT INTO maszkolt (login_maszk, email_maszk, nev_maszk, szulev_maszk, nem, cim_maszk)
SELECT
  LOGIN,
  EMAIL,
  NEV,
  SZULEV,
  NEM,
  CIM
FROM UGYFEL;

CREATE USER Maszkoltka1 WITHOUT LOGIN;

GRANT SELECT ON maszkolt TO Maszkoltka1;

EXECUTE AS USER = 'Maszkoltka1';
SELECT * FROM maszkolt;
REVERT;