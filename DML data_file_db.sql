INSERT INTO Manager (employeeID, name, position)
VALUES
    (300, 'John Smith', 'General Manager'),
    (311, 'Alice Johnson', 'Rooms Manager'),
    (312, 'David Brown', 'Housekeeping Manager');
	
INSERT INTO Department (deptID, name, employeeID)
VALUES
    (11, 'Facility', 300),
    (12, 'Office', 311),
    (13, 'Housekeeping', 312);
    

INSERT INTO Hotel (hotelID, hotelName, hotelAddress, capacity, employeeID)
VALUES
    (110, 'Grand Hotel', '625 E university , nm-88005' ,  200, 300),
    (111, 'Elegant Suites', 'Days Inn  Cruces, nm-88001',150, 311),
    (112, 'Cozy Inn', 'Historic Plaza, nm-416007' , 100, 312);
    
INSERT INTO AffiliatedWith (employeeID,hotelID, deptID)
VALUES
    (300, 110, 11),
    (311, 111, 12),
    (312, 112, 13);

INSERT INTO Room (roomID, roomType,hotelID, price)
VALUES
    (801, 'King',110, 200),
    (802, 'Double Queen',111,250),
    (803, 'Double Queen Accessible',112,250);
     
    
INSERT INTO Guest (guestID, name, address, phone, roomID)
VALUES
    (34, 'John Paul ', '123 Main St', '555-123-4567', 801),
    (35, 'Alice Johnson', '456 Elm St', '555-234-5678',802),
    (36, 'David Brown', '789 Oak St', '555-345-6789',803);


INSERT INTO Staff (employeeID, name, position, email, phone_number)
VALUES
    (300, 'Emma White', 'Front Desk Clerk','abc@gmail.com', 575312123),
    (311, 'Oliver Davis', 'Concierge','fgh@gmail.com', 575123312),
    (312, 'Sophia Wilson', 'Housekeeper','ijk@gmail.com', 575575575),
    (313, 'pratik harlikar', 'Rooms Manager','lmn@gmail.com', 575575665),
    (314, 'pracheta harlikar','Housekeeping Manager','opq@gmail.com', 575575666);
    

INSERT INTO Amenity (amenityID, amenityType, amenityName)
VALUES
    (221, 'Return', 'Blanket'),
    (222, 'Return', 'Iron'),
    (223, 'Consumable', 'Robe');
    
INSERT INTO Delivers (employeeID, guestID, amenityID, deliveryDateTime, quantity)
VALUES
    (300, 34, 221, '2023-09-27 10:00:00', 5),
    (311, 35, 222, '2023-09-28 11:30:00', 3),
    (312, 36, 223, '2023-09-29 09:45:00', 2);


INSERT INTO Stay (stayID, guestID, roomID, startDate, endDate,cost)
VALUES
    (701, 34, 801, '2023-09-27', '2023-09-30', 1969.00),
    (702, 35, 802, '2023-09-28', '2023-09-29',1979.00),
    (703, 36, 803, '2023-09-29', '2023-09-30',1959.00);


INSERT INTO Rental (guestID, itemName, stayID, eventDate, employeeID)
VALUES
    (34, 'Bicycle', 701, '2023-09-28', 300),
    (35, 'Golf clubs', 702, '2023-09-29', 311),
    (36, 'Games', 703, '2023-09-30', 312);


INSERT INTO OnCall (employeeID, startDate, endDate)
VALUES
    (300, '2023-09-27', '2023-10-01'),
    (311, '2023-09-28', '2023-09-30'),
    (312, '2023-09-30', '2023-10-04');


INSERT INTO Reservation (reserveID, guestID, employeeID, startDateTime, endDateTime)
VALUES
    (881, 34, 300, '2023-09-27 14:00:00', '2023-09-30 12:00:00'),
    (872, 35, 311, '2023-09-28 15:00:00', '2023-09-29 12:00:00'),
    (863, 36, 312, '2023-09-29 10:00:00', '2023-09-30 11:00:00');
    
INSERT INTO Service (employeeID, hotelID, roomID, roomType, cleanDate, cleanTime, cost)
VALUES
(300, 110, 801, 'king','2023-10-03', '11:02:01', 10),
(311, 111, 802, 'Queen Accessible', '2023-07-03', '10:00:02', 15),
(312, 112, 803, 'DoubleQueen Accessible', '2023-08-10' , '12:01:03', 15);	

UPDATE Reservation
SET endDateTime = '2023-09-30 12:00:00'
WHERE reserveID = 872;
	
UPDATE Guest
SET phone = '555-987-6543'
WHERE guestID = 34;

UPDATE  Rental
SET itemName = 'Movies'
WHERE guestID = 36;



    