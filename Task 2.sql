use travego;
-- 2. Perform read operation on the designed table created in the above task.
--  a. How many female passengers traveled a minimum distance of 600 KMs?
select count(*) AS countfemalepassenger
from passenger 
where gender ='f' AND distance >= 600;

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select *  
from passenger 
where distance > 500 AND bus_type = 'sleeper';


-- c. Select passenger names whose names start with the character 'S'.
select passenger_name 
from passenger 
where passenger_name like "S%";

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,Destination City, Bus type, 
-- and Price in the output.

select p.passenger_name,p.boarding_city,p.destination_city,p.bus_type,pr.price
from passenger p
join price pr ON p.bus_type = pr.bus_type AND p.distance = pr.distance;


-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select passenger_name, price from passenger p1 left join price p2 
using(distance,bus_type)
where p1.distance = 1000 and p1.bus_type = 'Sitting'
union
select passenger_name, price from passenger p1 right join price p2 
using(distance,bus_type)
where p2.distance = 1000 and p2.bus_type = 'Sitting';


-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? 
select passenger_name,p1.bus_type, price from passenger p1 left join price p2 
using(distance,bus_type)
where p1.distance = (select distance from passenger where passenger_name='Pallavi') and p1.bus_type in ('Sitting','Sleeper')
union
select passenger_name,p2.bus_type, price from passenger p1 right join price p2 
using(distance,bus_type)
where p2.distance = (select distance from passenger where passenger_name='Pallavi') and p2.bus_type in ('Sitting','Sleeper');


-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper 
UPDATE Passenger
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

select * from passenger;

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in 
-- the database.
DELETE FROM Passenger
WHERE Passenger_name = 'Piyush';

select * from passenger;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required). 
TRUNCATE TABLE Passenger;

-- j. Delete the table passenger from the database. 
DROP TABLE Passenger;