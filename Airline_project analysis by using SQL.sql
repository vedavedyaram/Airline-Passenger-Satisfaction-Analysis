create database	 airline_analysis;
use airline_analysis;


CREATE TABLE airline_data (
    `Unnamed: 0` INT,
    id INT,
    Gender VARCHAR(20),
    `Customer Type` VARCHAR(50),
    Age INT,
    `Type of Travel` VARCHAR(50),
    Class VARCHAR(30),
    Flight_Distance INT,
    `Inflight wifi service` INT,
    `Departure/Arrival time convenient` INT,
    `Ease of Online booking` INT,
    `Gate location` INT,
    `Food and drink` INT,
    `Online boarding` INT,
    `Seat comfort` INT,
    `Inflight entertainment` INT,
    `On-board service` INT,
    `Leg room service` INT,
    `Baggage handling` INT,
    `Checkin service` INT,
    `Inflight service` INT,
    Cleanliness INT,
    Departure_Delay INT,
    `Arrival Delay in Minutes` DECIMAL(10,2),
    satisfaction VARCHAR(50),
    Total_Delay DECIMAL(10,2),
    Age_Group VARCHAR(30));
    
    DESC airline_data;
    
LOAD DATA LOCAL INFILE
"C:/Users/mundr/OneDrive/Desktop/airline_cleaned.csv"
INTO TABLE airline_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# 1.Display first 10 records #
SELECT * FROM airline_data LIMIT 10;

# 2.Check total records #
SELECT COUNT(*) AS Total_Passengers FROM airline_data;

# 3.Find unique passenger genders #
SELECT DISTINCT GENDER FROM airline_data;

# 4.Find passengers aged above 40 #
SELECT * FROM airline_data where age > 40;

# 5.Find passengers travelling in Business Class #
SELECT * FROM airline_data where Class = 'Business';

# 6.Find passengers who are satisfied #
SELECT * FROM airline_data WHERE Satisfaction = 'satisfied';

# 7.Find passengers with flight distance above 1,000 #
SELECT * FROM airline_data WHERE Flight_Distance > 1000;

# 8.Find the top 10 longest flights #
SELECT * FROM airline_data ORDER BY Flight_Distance DESC LIMIT 10;


# 9. Total number of passengers, Average passenger age,	Maximum flight distance Minimum flight distance, Average departure delay, Total flight distance #
SELECT COUNT(*) AS Total_Passengers, AVG(Age) AS Average_Age, MAX(`Flight_Distance`) AS Maximum_Distance, MIN(`Flight_Distance`) AS Minimum_Distance FROM airline_data;

# 10.Count passengers by gender #
SELECT Gender, COUNT(*) AS Total_Passengers FROM airline_data GROUP BY Gender;

# 11.Count passengers by travel class #
SELECT Class, COUNT(*) AS Total_Passengers FROM airline_data  GROUP BY Class;

# 12.Find classes having more than 10,000 passengers #
SELECT Class, COUNT(*) AS Total_Passengers FROM airline_data  GROUP BY Class HAVING COUNT(*) > 10000;

# 13.Find satisfaction counts by class #
SELECT Class,satisfaction,COUNT(*) AS Passenger_Count FROM airline_data GROUP BY Class, satisfaction;

# 14.Categorize passengers based on age. #
SELECT
    Age,
    CASE
        WHEN Age <= 25 THEN 'Young'
        WHEN Age <= 45 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group
FROM airline_data;

# 15.Categorize passengers based on departure delay. #
SELECT
    `Departure_Delay`,
    CASE
        WHEN `Departure_Delay` = 0 THEN 'No Delay'
        WHEN `Departure_Delay` <= 30 THEN 'Short Delay'
        ELSE 'Long Delay'
    END AS Delay_Category
FROM airline_data;

# 16.Find passengers whose age is greater than the average age of all passengers. #
SELECT * FROM airline_data WHERE Age > (SELECT AVG(Age) FROM airline_data);

# 17.Find passengers whose flight distance is greater than the average flight distance. #
SELECT *FROM airline_data WHERE `Flight_Distance` > (SELECT AVG(`Flight_Distance`)FROM airline_data);

# 18.Find passengers whose departure delay is greater than the maximum average delay per class. #
SELECT *FROM airline_data WHERE `Departure_Delay` > (SELECT MAX(avg_delay) FROM (SELECT AVG(`Departure_Delay`) AS avg_delay FROM airline_data GROUP BY Class) AS delay_table);

# 19.Find total passengers by satisfaction using CTE. #
WITH satisfaction_cte AS (
    SELECT
        satisfaction,
        COUNT(*) AS Total_Passengers
    FROM airline_data
    GROUP BY satisfaction)
SELECT * FROM satisfaction_cte;

# 20.Find average flight distance by travel class using CTE. #
WITH class_cte AS (
    SELECT
        Class,
        AVG(`Flight_Distance`) AS Avg_Distance
    FROM airline_data
    GROUP BY Class)
SELECT *
FROM class_cte ORDER BY Avg_Distance DESC;

# 21.Find passenger counts by customer type and satisfaction using CTE #
WITH customer_cte AS (
    SELECT
        `Customer Type`,
        satisfaction,
        COUNT(*) AS Total_Passengers
    FROM airline_data
    GROUP BY `Customer Type`, satisfaction)
SELECT * FROM customer_cte ORDER BY `Customer Type`;

# By using  Windows Functions #
# 22. Calculate the overall average passenger age and display it alongside every passenger.# 
select id,Age, avg(age) over() as overall_avg_age  FROM airline_data;

# 23.Calculate average flight distance for each class using a window function. #
SELECT id,Class,`Flight_Distance`,AVG(`Flight_Distance`) OVER(PARTITION BY Class) AS Avg_Class_Distance FROM airline_data;

# 24. Rank travel classes by passenger count. #
SELECT Class, COUNT(*) AS Total_Passengers, RANK() OVER(ORDER BY COUNT(*) DESC) AS Class_Rank FROM airline_data GROUP BY Class;


# 25. Rank satisfaction categories based on passenger count using DENSE_RANK(). #
SELECT satisfaction, COUNT(*) AS Total_Passengers, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS Satisfaction_Rank FROM airline_data GROUP BY satisfaction;

# 26. Rank travel classes based on average passenger age using DENSE_RANK(). #
SELECT Class, AVG(Age) AS Avg_Age, DENSE_RANK() OVER(ORDER BY AVG(Age) DESC) AS Age_Rank FROM airline_data GROUP BY Class;

# 27. Rank customer types based on average departure delay using DENSE_RANK().  #
SELECT `Customer Type`, AVG(`Departure_Delay`) AS Avg_Delay, DENSE_RANK() OVER(ORDER BY AVG(`Departure_Delay`) DESC) AS Delay_Rank FROM airline_data GROUP BY `Customer Type`;

# 28. Assign row numbers to passengers based on age in descending order. #
SELECT id, Age, ROW_NUMBER() OVER(ORDER BY Age DESC, id) AS Row__Number FROM airline_data;

#  29. Assign row numbers to passengers based on flight distance. #
SELECT id, `Flight_Distance`, ROW_NUMBER() OVER(ORDER BY `Flight_Distance` DESC, id) AS Row__Number FROM airline_data;

# 30. Assign row numbers separately for each travel class. #
SELECT id, Class, Age, ROW_NUMBER() OVER(PARTITION BY Class ORDER BY Age DESC, id) AS Row__Number FROM airline_data;

#  31. Calculate average flight distance within each travel class using PARTITION BY. #
SELECT id, Class, `Flight_Distance`, AVG(`Flight_Distance`) OVER(PARTITION BY Class) AS Avg_Distance FROM airline_data;

# 32. Calculate passenger count for each class and satisfaction category using PARTITION BY. #
SELECT id, Class, satisfaction, COUNT(*) OVER(PARTITION BY Class, satisfaction) AS Passenger_Count FROM airline_data;

#  33. Rank passengers based on departure delay within each travel class using PARTITION BY. #
SELECT id, Class, `Departure_Delay`, RANK() OVER(PARTITION BY Class ORDER BY `Departure_Delay` DESC) AS Delay_Rank FROM airline_data;

# View #
#  34. Create a view for passenger satisfaction analysis. #
CREATE VIEW satisfaction_view AS SELECT satisfaction, COUNT(*) AS Total_Passengers FROM airline_data GROUP BY satisfaction;

# 35. Create a view for class-wise passenger analysis. #
CREATE VIEW class_view AS SELECT Class, COUNT(*) AS Total_Passengers, AVG(Age) AS Avg_Age, AVG(`Flight_Distance`) AS Avg_Distance FROM airline_data GROUP BY Class;

#  36. Create a view for flight delay analysis.# 
CREATE VIEW delay_view AS SELECT Class, AVG(`Departure_Delay`) AS Avg_Departure_Delay, AVG(`Arrival Delay in Minutes`) AS Avg_Arrival_Delay FROM airline_data GROUP BY Class;

#  37. Display the satisfaction view.  #
SELECT * FROM satisfaction_view;

# 38. Display the class view. #
SELECT * FROM class_view;

#  39. Display the delay view. # 
SELECT * FROM delay_view;

# 40. Find the previous passenger's age using LAG(). #
SELECT id, Age, LAG(Age) OVER(ORDER BY id) AS Previous_Age FROM airline_data;

#  41. Find the next passenger's age using LEAD(). #
SELECT id, Age, LEAD(Age) OVER(ORDER BY id) AS Next_Age FROM airline_data;

# 42. Find the highest flight distance in each travel class. # 
SELECT id, Class, `Flight_Distance`, MAX(`Flight_Distance`) OVER(PARTITION BY Class) AS Max_Class_Distance FROM airline_data;

#  43. Find the lowest departure delay in each travel class .#
SELECT id, Class, `Departure_Delay`, MIN(`Departure_Delay`) OVER(PARTITION BY Class) AS Min_Class_Delay FROM airline_data;
