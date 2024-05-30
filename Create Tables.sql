Create schema if not exists TrainStation;

Create table Passenger
(
ID_Passenger INT(4) NOT NULL Primary Key,
FirstName VARCHAR(20) ,
SecondName VARCHAR(20) ,
Year INT(4) ,
month INT(4),
day INT(4) ,
email VARCHAR(40) NOT NULL Unique
);

Create table Train
(
TrainNo INT(3) NOT NULL Primary Key ,
Destnation VARCHAR(30) NOT NULL ,
Departure DATETIME,
TrainPath INT(2) NOT NULL 
);

create table Staff 
(
ID_Staff INT(4) PRIMARY KEY ,
FirstName VARCHAR(20) NOT NULL, 
SecondName VARCHAR(20) NOT NULL,
Year INT(4),
Month INT(4),
Day INT(4),
JobName VARCHAR(30) NOT NULL,
Salary INT(6) NOT NULL
); 

CREATE TABLE Driver
(
License_No   INT(4) NOT NULL,
FirstName    VARCHAR(20) NOT NULL,
SecondName   VARCHAR(20) NOT NULL,
CONSTRAINT Driver_PK PRIMARY KEY (License_No)
);

CREATE TABLE Station
(
StationName       VARCHAR(50),
TimeDestination   INT(2),
TimeDeparture     INT(2),
Station_No        INT(4) NOT NULL,
CONSTRAINT Station_PK PRIMARY KEY (Station_No)
);

Create table StopTS
(
TrNo INT(3) NOT NULL,
StNo INT(4) NOT NULL,
CONSTRAINT StopTS_PK PRIMARY KEY (TrNo, StNo),
CONSTRAINT StopTS_FK1 foreign key (TrNo) references Train(TrainNo) on update cascade on delete cascade,
CONSTRAINT StopTS_FK2 foreign key (StNo) references Station(Station_No) on update cascade on delete cascade
);

CREATE TABLE Drive
(
  LiNo INT(4) NOT NULL,
  TrNo INT(3) NOT NULL,
  PRIMARY KEY (LiNo, TrNo),
  FOREIGN KEY (LiNo) REFERENCES Driver(License_No) on update cascade on delete cascade,
  FOREIGN KEY (TrNo) REFERENCES Train(TrainNo) on update cascade on delete cascade
);

create table Carry_On
(
trNo int(3) not null,
ticket_No int(3) not null,
ticket_type varchar(10) not null check(ticket_type in('Economy', 'Bussinus')),
IDPa int(4) not null,
primary key (IDPa, trNo),
foreign key (trNo) references Train(TrainNo) on update cascade on delete cascade,
foreign key (IDPa) references Passenger(ID_passenger) on update cascade on delete cascade
);

Create table Works_in
(
IDSt INT(4) NOT NULL,
TrNo INT(3) NOT NULL,
Start_Date DATE,
primary key (IDSt, TrNo),
foreign key (IDSt) references Staff(ID_Staff) on update cascade on delete cascade,
foreign key (TrNo) references Train(TrainNo) on update cascade on delete cascade
);

CREATE TABLE Pass_PNumber
(
  ID_Passenger INT(4) NOT NULL,
  PPNum VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Passenger, PPNum),
  FOREIGN KEY (ID_Passenger) REFERENCES Passenger(ID_Passenger) ON UPDATE CASCADE ON DELETE CASCADE
);


