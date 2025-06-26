CREATE DATABASE los_dulces_suenos_resort;

-- Use the database
USE los_dulces_suenos_resort;

-- Create Manager table
CREATE TABLE Manager (
    employeeID INT PRIMARY KEY,
    name VARCHAR(40),
    position VARCHAR(40) CHECK (position IN ('General Manager', 'Rooms Manager', 'Housekeeping Manager', 'Restaurant Manager', 'Front Office Manager', 'Valet Manager', 'IT Manager', 'Facilities Manager'))
);

-- Create Department table
CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    name VARCHAR(40) CHECK (name IN ('Facility', 'Office', 'Housekeeping', 'Restaurant', 'Security')),
    employeeID INT,
    FOREIGN KEY (employeeID) REFERENCES Manager(employeeID)
);

-- Create Hotel table
CREATE TABLE Hotel (
    hotelID INT PRIMARY KEY,
    hotelName VARCHAR(40),
    hotelAddress VARCHAR(40),
    capacity INT CHECK (capacity <= 250),
    employeeID INT,
    FOREIGN KEY (employeeID) REFERENCES Manager(employeeID)
);

-- Create AffiliatedWith table
CREATE TABLE AffiliatedWith (
    employeeID INT,
    hotelID INT,
    deptID INT,
	PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeID) REFERENCES Hotel(employeeID),
    FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID),
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

-- Create Room table
CREATE TABLE Room (
    hotelID INT,
    roomID INT PRIMARY KEY,
    roomType VARCHAR(40) CHECK (roomType IN ('King', 'Double Queen', 'Double Queen Accessible')),
    price DECIMAL,
    FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID)
);

-- Create Guest table
CREATE TABLE Guest (
    guestID INT PRIMARY KEY,
    name VARCHAR(40),
    address VARCHAR(100),
    phone VARCHAR(16),
    roomID INT,
    FOREIGN KEY (roomID) REFERENCES Room(roomID)
);

-- Create Staff table
CREATE TABLE Staff (
    employeeID INT PRIMARY KEY,
    name VARCHAR(20),
    email VARCHAR(30),
    position VARCHAR(40) CHECK (position IN ('Front Desk Clerk', 'Concierge', 'Housekeeper', 'Valet', 'Chef', 'Server', 'Security Officer', 'Rooms Manager','Housekeeping Manager', 'Restaurant Manager', 'Front Office Manager', 'Valet Manager', 'IT Manager', 'Facilities Manager' )),
    phone_number VARCHAR(10)
);

-- Create Amenity table
CREATE TABLE Amenity (
    amenityID INT PRIMARY KEY,
    amenityType VARCHAR(30) CHECK (amenityType IN ('Consumable', 'Return')),
    amenityName VARCHAR(40) CHECK (amenityName IN ('Pillow', 'Blanket', 'Iron', 'Robe', 'Hair Dryer', 'Toiletries'))
);

-- Create Delivers table
CREATE TABLE Delivers (
    employeeID INT,
    guestID INT,
    amenityID INT,
    deliveryDateTime DATETIME,
    quantity INT CHECK (quantity <= 5),
	PRIMARY KEY (employeeID, guestID),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (amenityID) REFERENCES Amenity(amenityID)
);

-- Create Stay table
CREATE TABLE Stay (
    stayID INT,
    guestID INT,
    roomID INT,
    startDate DATE,
    endDate DATE,
    cost DECIMAL,
	PRIMARY KEY (stayID, guestID),
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (roomID) REFERENCES Room(roomID)
);

-- Create Rental table
CREATE TABLE Rental (
    guestID INT,
    itemName VARCHAR(40),
    stayID INT,
    eventDate DATE,
    employeeID INT,
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (stayID) REFERENCES Stay(stayID),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    PRIMARY KEY (guestID, itemName, stayID),
    CHECK ( itemName IN (
            'Golf clubs', 'Tennis racket', 'Bicycle', 'Golf cart', 'Games', 'Movies'
        )
    )
);


-- Create OnCall table
CREATE TABLE OnCall (
   employeeID INT, 
   startDate DATE,
   endDate DATE,
	PRIMARY KEY(employeeID, startDate,endDate),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID)
);

-- Create Reservation table
CREATE TABLE Reservation (
    reserveID INT PRIMARY KEY,
    guestID INT,
    employeeID INT,
    startDateTime DATETIME,
    endDateTime DATETIME,
    FOREIGN KEY (guestID) REFERENCES Guest(guestID),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID)
);

-- Create Service table
CREATE TABLE Service (
    employeeID INT,
    hotelID INT,
    roomID INT,
    roomType
     VARCHAR(40),
    cleanDate DATE,
    cleanTime TIME,
    cost DECIMAL,
    primary key ( employeeID  ,hotelID , roomID , roomType),
    FOREIGN KEY (employeeID) REFERENCES Staff(employeeID),
    FOREIGN KEY (hotelID) REFERENCES Hotel(hotelID),
    FOREIGN KEY (roomID) REFERENCES Room(roomID)
);



