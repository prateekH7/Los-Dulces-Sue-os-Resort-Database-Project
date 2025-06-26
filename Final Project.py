import datetime
import pymysql
pymysql.install_as_MySQLdb()
import MySQLdb
import MySQLdb.cursors
import sys

def Q1():
    mydbms_qu1 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass = MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu1.cursor()

    qu1 = 'SELECT g.guestID, g.name, g.address, g.phone, r.roomID, r.roomType FROM Guest g, Reservation rev, Room r WHERE g.guestID = rev.guestID AND g.roomID = r.roomID;'

    mycursor.execute(qu1)
    result = mycursor.fetchall()

    for x in result:
        print(x)

def Q2():
    mydbms_qu2 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass=MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu2.cursor()

    qu2 = "SELECT S.employeeID, S.hotelID, S.roomID, S.roomType, S.cleanDate, S.cleanTime, S.cost FROM Service S where S.employeeID IN ( SELECT employeeID FROM Staff WHERE position = 'Housekeeper'); "

    mycursor.execute(qu2)
    result = mycursor.fetchall()

    for x in result:
        print(x)


def Q3():
    mydbms_qu3 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass=MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu3.cursor()

    qu3 = "SELECT G.name, G.address, G.roomID, S.startDate, S.endDate FROM Guest G, Stay S WHERE G.guestID = S.guestID;"

    mycursor.execute(qu3)
    result = mycursor.fetchall()

    for x in result:
        print(x)


def Q4(name):
    mydbms_qu4 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass=MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu4.cursor()

    qu4 = "SELECT G.name, A.amenityType, R.roomType FROM Guest G, Amenity A, Room R, Delivers D WHERE G.guestID = D.guestID AND D.amenityID = A.amenityID AND G.roomID = R.roomID AND G.name = '{}';".format(name)

    mycursor.execute(qu4)
    result = mycursor.fetchall()

    for x in result:
        print(x)

def Q5():
    mydbms_qu5 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass=MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu5.cursor()

    qu4 = ( "SELECT S.employeeID, S.name, S.email, S.phone_number, S.position FROM Staff S WHERE S.position IN ('Rooms Manager', 'Housekeeping Manager', 'Restaurant Manager', 'Front Office Manager', 'Valet Manager', 'IT Manager', 'Facilities Manager'); ")

    mycursor.execute(qu4)
    result = mycursor.fetchall()

    for x in result:
        print(x)


def Q6():
    mydbms_qu6 = MySQLdb.connect(
        host="localhost",
        user="root",
        password="Pratikharlikar@10",
        db="los_dulces_suenos_resort",
        cursorclass=MySQLdb.cursors.DictCursor
    )

    mycursor = mydbms_qu6.cursor()

    qu6 = "SELECT h.hotelName, h.capacity, COUNT(o.employeeID) as onCallStaff FROM Hotel h, OnCall o, Staff s WHERE h.employeeID = o.employeeID AND s.employeeID = o.employeeID GROUP BY h.hotelName, h.capacity HAVING h.capacity > 0.9 * 250 AND COUNT(o.employeeID) < 10; "

    mycursor.execute(qu6)
    result = mycursor.fetchall()

    for x in result:
        print(x)


# Main function
def main():
    if sys.argv[1] == '1':
        Q1()
    elif sys.argv[1] == '2':
        Q2()
    elif sys.argv[1] == '3':
        Q3()
    elif len(sys.argv) == 3 and sys.argv[1] == '4':
        name = sys.argv[2]
        Q4(name)
    elif sys.argv[1] == '5':
        Q5()
    elif sys.argv[1] == '6':
        Q6()


if __name__ == "__main__":
    main()
