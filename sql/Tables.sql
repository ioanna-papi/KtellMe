CREATE TABLE Itinerary (itId INT PRIMARY KEY,
			itName VARCHAR(40) NOT NULL UNIQUE,
                        price DOUBLE NOT NULL,
                        beginning VARCHAR(30) NOT NULL,
                        station1 VARCHAR(30),
                        station2 VARCHAR(30),
                        station3 VARCHAR(30),
                        station4 VARCHAR(30),
                        time1 VARCHAR(10),
                        time2 VARCHAR(10),
                        time3 VARCHAR(10),
                        time4 VARCHAR(10),
                        ending VARCHAR(30) NOT NULL)
                        ENGINE=InnoDB DEFAULT CHARSET=utf8;
                        

CREATE TABLE Bus (busNumber INT PRIMARY KEY)
		 ENGINE=InnoDB DEFAULT CHARSET=utf8;
                                            						  

CREATE TABLE Trip (tripId INT PRIMARY KEY,
		   itineraryId INT NOT NULL,
                   dep_date DATE NOT NULL,
                   busNumber INT NOT NULL,
                   FOREIGN KEY (itineraryId) REFERENCES Itinerary(itId),
                   FOREIGN KEY (busNumber) REFERENCES Bus(busNumber))
                   ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE Registered_Customer (cId INT PRIMARY KEY,
				 username VARCHAR(30) NOT NULL,
                                 passwd VARCHAR(30) NOT NULL,
                                 firstname VARCHAR(30),
                                 surname VARCHAR(30),
                                 birthdate DATE)
                                 ENGINE=InnoDB DEFAULT CHARSET=utf8;
                               
                          
                      
                      
 CREATE TABLE Product(prodId INT PRIMARY KEY,
                      custId INT NOT NULL,
                      itId INT NOT NULL,
                      price DOUBLE NOT NULL,
                      departure INT NOT NULL,
                      destination INT NOT NULL,
                      dep_time INT NOT NULL,
                      dep_date DATE,
                      FOREIGN KEY(custId) REFERENCES Registered_customer(cId),
                      FOREIGN KEY(itId) REFERENCES Itinerary(itId))
                      ENGINE=InnoDB DEFAULT CHARSET=utf8;
                      
                      
                      
                      
CREATE TABLE Parcel(parcId INT PRIMARY KEY,
                    receiverName VARCHAR(30) NOT NULL,
                    receiverSurname VARCHAR(30) NOT NULL,
                    receiverEmail VARCHAR(30) NOT NULL,
                    receiverPhone VARCHAR(10) NOT NULL,
                    senderName VARCHAR(30) NOT NULL,
                    senderSurname VARCHAR(30) NOT NULL,
                    senderEmail VARCHAR(30) NOT NULL,
                    senderPhone VARCHAR(10) NOT NULL,
                    height DOUBLE NOT NULL,
                    length DOUBLE NOT NULL,
		    width DOUBLE NOT NULL,
                    weight DOUBLE NOT NULL,
                    comments VARCHAR(100),
                    FOREIGN KEY(parcId) REFERENCES Product(prodId))
                    ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE Ticket(tickId INT PRIMARY KEY,
                    firstname VARCHAR(30) NOT NULL,
                    surname VARCHAR(30) NOT NULL,
                    email VARCHAR(30) NOT NULL,
                    phone VARCHAR(10) NOT NULL,
                    discount DOUBLE,
                    FOREIGN KEY(tickId) REFERENCES Product(prodId))
                    ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (1,'ΑΘΗΝΑ - ΙΩΑΝΝΙΝΑ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)', 'ΑΣΠΡΟΠΥΡΓΟΣ', 'ΚΟΡΙΝΘΟΣ', 'Δ. ΑΙΤΩΛΙΚΟΥ', 'ΠΗΓΕΣ ΛΟΥΡΟΥ', 'ΙΩΑΝΝΙΝΑ (ΣΤΑΘΜΟΣ)',39.0,'13:00','16:00','19:00','21:00');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (2,'ΙΩΑΝΝΙΝΑ - ΑΘΗΝΑ','ΙΩΑΝΝΙΝΑ (ΣΤΑΘΜΟΣ)','ΠΗΓΕΣ ΛΟΥΡΟΥ', 'Δ. ΑΙΤΩΛΙΚΟΥ','ΚΟΡΙΝΘΟΣ','ΑΣΠΡΟΠΥΡΓΟΣ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)',39.0,'12:30','14:30','17:30','20:30');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (3,'ΑΘΗΝΑ - ΠΑΤΡΑ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)','ΜΕΓΑΡΑ', 'ΚΟΡΙΝΘΟΣ', 'ΑΙΓΙΟ', 'ΚΙΑΤΟ', 'ΠΑΤΡΑ (ΣΤΑΘΜΟΣ)',18.9,'09:45','13:45','18:45','21:45');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (4,'ΠΑΤΡΑ - ΑΘΗΝΑ','ΠΑΤΡΑ (ΣΤΑΘΜΟΣ)', 'ΚΙΑΤΟ', 'ΑΙΓΙΟ', 'ΚΟΡΙΝΘΟΣ', 'ΜΕΓΑΡΑ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)',18.9,'12:30','14:30','17:30','20:30');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (5,'ΑΘΗΝΑ - ΘΕΣΣΑΛΟΝΙΚΗ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)','ΚΑΣΤΡΟ','ΛΑΜΙΑ','ΒΟΛΟΣ','ΚΑΤΕΡΙΝΗ', 'ΘΕΣΣΑΛΟΝΙΚΗ (ΣΤ. ΜΑΚΕΔΟΝΙΑΣ)',36.0,'12:00','14:00','18:00','21:00'); 
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (6,'ΘΕΣΣΑΛΟΝΙΚΗ - ΑΘΗΝΑ','ΘΕΣΣΑΛΟΝΙΚΗ (ΣΤ. ΜΑΚΕΔΟΝΙΑΣ)','ΚΑΤΕΡΙΝΗ','ΒΟΛΟΣ','ΛΑΜΙΑ','ΚΑΣΤΡΟ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)',36.0,'13:45','16:45','19:45','21:45');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (7,'ΑΘΗΝΑ - ΛΑΜΙΑ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)','ΑΙΦΙΔΕΣ','ΘΗΒΑ','ΚΑΣΤΡΟ','ΑΡΚΙΤΣΑ', 'ΛΑΜΙΑ (ΣΤΑΘΜΟΣ)',20.3,'12:25','15:25','18:25','20:25');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (8,'ΛΑΜΙΑ - ΑΘΗΝΑ','ΛΑΜΙΑ (ΣΤΑΘΜΟΣ)','ΑΡΚΙΤΣΑ','ΚΑΣΤΡΟ','ΘΗΒΑ','ΑΙΦΙΔΕΣ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)',20.3,'13:30','15:30','17:30','20:30');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (9,'ΑΘΗΝΑ - ΛΑΡΙΣΑ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)','ΑΥΛΩΝΑΣ','ΛΑΜΙΑ','ΑΛΜΥΡΟΣ','ΒΟΛΟΣ','ΛΑΡΙΣΑ (ΣΤΑΘΜΟΣ)',30.0,'13:45','16:45','19:45','21:45');
INSERT INTO Itinerary(itid,itname,beginning,station1,station2,station3,station4,ending,price,time1,time2,time3,time4) VALUES (10,'ΛΑΡΙΣΑ - ΑΘΗΝΑ','ΛΑΡΙΣΑ (ΣΤΑΘΜΟΣ)','ΒΟΛΟΣ','ΑΛΜΥΡΟΣ','ΛΑΜΙΑ','ΑΥΛΩΝΑΣ','ΑΘΗΝΑ (ΣΤ. ΚΗΦΙΣΟΥ)',30.0,'13:00','16:00','19:00','21:00');


INSERT INTO bus VALUES(1);
INSERT INTO bus VALUES(2);
INSERT INTO bus VALUES(3);
INSERT INTO bus VALUES(4);
INSERT INTO bus VALUES(5);
INSERT INTO bus VALUES(6);
INSERT INTO bus VALUES(7);
INSERT INTO bus VALUES(8);
INSERT INTO bus VALUES(9);
INSERT INTO bus VALUES(10);

INSERT INTO trip VALUES(101, 1, '2021-01-01', 1);
INSERT INTO trip VALUES(102, 1, '2021-01-02', 1);
INSERT INTO trip VALUES(103, 1, '2021-01-03', 1);
INSERT INTO trip VALUES(104, 1, '2021-01-04', 1);
INSERT INTO trip VALUES(105, 1, '2021-01-05', 1);
INSERT INTO trip VALUES(106, 1, '2021-01-06', 1);
INSERT INTO trip VALUES(107, 1, '2021-01-07', 1);
INSERT INTO trip VALUES(108, 2, '2021-01-01', 2);
INSERT INTO trip VALUES(109, 2, '2021-01-02', 2);
INSERT INTO trip VALUES(110, 2, '2021-01-03', 2);
INSERT INTO trip VALUES(111, 2, '2021-01-04', 2);
INSERT INTO trip VALUES(112, 2, '2021-01-05', 2);
INSERT INTO trip VALUES(113, 2, '2021-01-06', 2);
INSERT INTO trip VALUES(114, 2, '2021-01-07', 2);
INSERT INTO trip VALUES(115, 3, '2021-01-01', 3);
INSERT INTO trip VALUES(116, 3, '2021-01-02', 3);
INSERT INTO trip VALUES(117, 3, '2021-01-03', 3);
INSERT INTO trip VALUES(118, 3, '2021-01-04', 3);
INSERT INTO trip VALUES(119, 3, '2021-01-05', 3);
INSERT INTO trip VALUES(120, 3, '2021-01-06', 3);
INSERT INTO trip VALUES(121, 3, '2021-01-07', 3);
INSERT INTO trip VALUES(122, 4, '2021-01-01', 4);
INSERT INTO trip VALUES(123, 4, '2021-01-02', 4);
INSERT INTO trip VALUES(124, 4, '2021-01-03', 4);
INSERT INTO trip VALUES(125, 4, '2021-01-04', 4);
INSERT INTO trip VALUES(126, 4, '2021-01-05', 4);
INSERT INTO trip VALUES(127, 4, '2021-01-06', 4);
INSERT INTO trip VALUES(128, 4, '2021-01-07', 4);
INSERT INTO trip VALUES(129, 5, '2021-01-01', 5);
INSERT INTO trip VALUES(130, 5, '2021-01-02', 5);
INSERT INTO trip VALUES(131, 5, '2021-01-03', 5);
INSERT INTO trip VALUES(132, 5, '2021-01-04', 5);
INSERT INTO trip VALUES(133, 5, '2021-01-05', 5);
INSERT INTO trip VALUES(134, 5, '2021-01-06', 5);
INSERT INTO trip VALUES(135, 5, '2021-01-07', 5);
INSERT INTO trip VALUES(136, 6, '2021-01-01', 6);
INSERT INTO trip VALUES(137, 6, '2021-01-02', 6);
INSERT INTO trip VALUES(138, 6, '2021-01-03', 6);
INSERT INTO trip VALUES(139, 6, '2021-01-04', 6);
INSERT INTO trip VALUES(140, 6, '2021-01-05', 6);
INSERT INTO trip VALUES(141, 6, '2021-01-06', 6);
INSERT INTO trip VALUES(142, 6, '2021-01-07', 6);
INSERT INTO trip VALUES(143, 7, '2021-01-01', 7);
INSERT INTO trip VALUES(144, 7, '2021-01-02', 7);
INSERT INTO trip VALUES(145, 7, '2021-01-03', 7);
INSERT INTO trip VALUES(146, 7, '2021-01-04', 7);
INSERT INTO trip VALUES(147, 7, '2021-01-05', 7);
INSERT INTO trip VALUES(148, 7, '2021-01-06', 7);
INSERT INTO trip VALUES(149, 7, '2021-01-07', 7);
INSERT INTO trip VALUES(150, 8, '2021-01-01', 8);
INSERT INTO trip VALUES(151, 8, '2021-01-02', 8);
INSERT INTO trip VALUES(152, 8, '2021-01-03', 8);
INSERT INTO trip VALUES(153, 8, '2021-01-04', 8);
INSERT INTO trip VALUES(154, 8, '2021-01-05', 8);
INSERT INTO trip VALUES(155, 8, '2021-01-06', 8);
INSERT INTO trip VALUES(156, 8, '2021-01-07', 8);
INSERT INTO trip VALUES(157, 9, '2021-01-01', 9);
INSERT INTO trip VALUES(158, 9, '2021-01-02', 9);
INSERT INTO trip VALUES(159, 9, '2021-01-03', 9);
INSERT INTO trip VALUES(160, 9, '2021-01-04', 9);
INSERT INTO trip VALUES(161, 9, '2021-01-05', 9);
INSERT INTO trip VALUES(162, 9, '2021-01-06', 9);
INSERT INTO trip VALUES(163, 9, '2021-01-07', 9);
INSERT INTO trip VALUES(164, 10, '2021-01-01', 10);
INSERT INTO trip VALUES(165, 10, '2021-01-02', 10);
INSERT INTO trip VALUES(166, 10, '2021-01-03', 10);
INSERT INTO trip VALUES(167, 10, '2021-01-04', 10);
INSERT INTO trip VALUES(168, 10, '2021-01-05', 10);
INSERT INTO trip VALUES(169, 10, '2021-01-06', 10);
INSERT INTO trip VALUES(170, 10, '2021-01-07', 10);
