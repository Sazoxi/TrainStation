use TrainStation;

insert into Passenger (ID_passenger,FirstName,SecondName,Year,month,day,email)
values (1031,'Sara','Alselami',2024,11,1,'saraals@hotmail.com'),
(1050,'Lujain','Abduljalil',2024,11,2,'lujainmishal@hotmail.com'),
(1068,'Sama','Alowni',2024,11,3,'samalwo@hotmail.com') ,
(1074,'Samaher','Alowni',2024,11,3,'samaherlwo@hotmail.com'),
(1216,'Suha','Emam',2024,11,3,'suhaem@hotmail.com');

insert into Train (TrainNo,Destnation,Departure,TrainPath)
values (217,'JEDDAH','2024-11-2 23:18:17',5),
(399,'MAKKAH','2024-11-2 21:15:00',2),
(467,'RIYADH','2024-11-3 23:01:20',4),
(510,'TABUK','2024-11-3 20:10:17',1),
(722,'MADINAH','2024-11-4 05:20:13',8),
(111,'ABHA','2024-10-8 00:23:10',9),
(100, 'TAIF', '2024-12-1 04:30:15', 1);

insert into Staff (FirstName, SecondName, Year, Month, Day, JobName, Salary, ID_Staff)
VALUES ('Bashayer', 'Khan', '2004', '2', '28', 'Customer Service', '5000', '5661'),
('Suzan', 'Emam', '2005', '3', '10', 'Driver', '7000', '1391'),
('Myasim', 'Alsharif', '2005', '8', '15', 'Station Mnager', '5000', '7020'),
('Aseel', 'Alyamani', '2003', '4', '17', 'Ticket Agent', '5000', '1163'),
('Wejdan', 'Alsharif', '2004', '9', '11', 'Porter', '5000', '2817');
 
insert into Driver (License_No, FirstName, SecondName)
VALUES (1324, 'Ali', 'Alsharif'),
(7895, 'Hasan', 'Alghamdi'),
(1114, 'Hani', 'Alharbi'),
(6348, 'Omar', 'Basha'),
(7612, 'Amir', 'Alzied');

insert into Station (StationName, TimeDestination, TimeDeparture, Station_No)
VALUES ('Makkah', 2, 12, 3457),
('Madinah', 3, 1, 3475),
('Jeddah', 4, 4, 3471),
('Riyadh', 5, 1, 3470),
('Dammam', 6, 8, 3476),
('Makkah', 12, 5, 3411);

insert into StopTS (TrNo, StNo)
VALUES (217, 3457),
(399, 3475),
(467, 3471),
(510, 3470),
(722, 3476),
(111, 3411);

insert into Drive (TrNo, LiNo)
VALUES (217, 1324),
(399, 7895),
(467, 1114),
(510, 6348),
(722, 7612),
(111, 6348);

insert into Carry_On (trNo, ticket_No, ticket_type, IDPa) 
values (217, 166,'Bussinus', 1031),
(399, 200, 'Bussinus', 1050),
(467, 334, 'Economy', 1068),
(510, 415, 'Economy', 1074),
(722, 598, 'Bussinus', 1216);

insert into Works_in (IDSt, TrNo, Start_Date)
VALUES ('5661', 217, '2023-07-17'),
('1391', 399, '2018-05-10'),
('7020', 467, '2013-04-19'),
('1163', 510,'2017-03-09'),
('2817', 722,'2011-09-12'),
('1163', 100,'2020-01-07');

insert into Pass_PNumber (ID_Passenger, PPNum)
values (1031, '0555629812'),
(1050, '0561183590'),
(1068, '0590041923'),
(1074, '0557333295'),
(1216, '0540808746'),
(1074, '0555532898');
 
update Staff set Salary = 10000 where Salary = 5000 and ID_Staff = 7020;
update Staff set JobName = 'Mechanical Engineer' where JobName = 'Driver' and ID_Staff = 1391;

delete from Station where Station_No = 3411;
delete from Train where TrainNo = 111;

select * from pass_pnumber where ID_Passenger = 1074;
select StationName, Station_No from Station where Station_No > 3470;
SELECT ID_Staff FROM Staff;

select * from Passenger order by ID_Passenger;
select * from driver order by FirstName desc, SecondName desc;
SELECT StationName, Station_No FROM Station ORDER BY StationName;

select ID_Passenger, count(PPNum) FROM Pass_PNumber group by ID_Passenger;
select ticket_type, count(trNo) FROM Carry_On group by ticket_type having count(trNo) = 2;

SELECT * FROM Passenger INNER JOIN Pass_PNumber ON Passenger.ID_Passenger = Pass_PNumber.ID_Passenger;

select * from Passenger where ID_Passenger in (select ID_Passenger from Pass_PNumber where PPNum = 0540808746);