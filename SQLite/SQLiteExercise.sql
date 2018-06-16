--https://github.com/lerocha/chinook-database/wiki/Chinook-Schema
--http://poorsql.com

--How many albums does the artist Led Zeppelin have? (Subquery)
SELECT COUNT(albumID)
FROM albums
WHERE artistID IN (
		SELECT artistID
		FROM artists
		WHERE name = 'Led Zeppelin'
		)
GROUP BY artistID

--How many albums does the artist Led Zeppelin have? (Inner Join)
SELECT Artists.name, COUNT(Albums.albumId)
FROM Artists
INNER JOIN Albums ON Artists.artistID = Albums.artistId
WHERE Artists.name = 'Led Zeppelin';

--Create a list of album titles and the unit prices for the artist "Audioslave".
SELECT Albums.title, Tracks.name, Tracks.unitprice
FROM (
	Albums INNER JOIN Artists ON Albums.artistId = Artists.artistId
	)
INNER JOIN Tracks ON Albums.albumID = tracks.albumID
WHERE Artists.name = 'Audioslave'

--Find the first and last name of any customer who does not have an invoice.
SELECT FirstName, LastName
FROM customers
WHERE customerid NOT IN (
		SELECT customerID
		FROM invoices
		)

--Find the total price for each album.
SELECT Albums.title, sum(unitprice) AS TotalPrice
FROM Tracks
INNER JOIN Albums ON Albums.albumID = Tracks.albumID
--where albums.title = 'Big Ones'
GROUP BY Tracks.albumID

--How many records are created when you apply a Cartesian join to the invoice and invoice items table?
SELECT COUNT()
FROM invoices
CROSS JOIN invoices
-- or select * from invoices a cross join invoices b

--Find the names of all the tracks for the album "Californication". (Subquery)
SELECT name
FROM tracks
WHERE albumID IN (
		SELECT albumID
		FROM albums
		WHERE title = "Californication"
		)
ORDER BY trackID;

--Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT Customers.firstName, Customers.lastname, Customers.city, customers.email, count(invoices.invoiceID) AS Total
FROM customers
INNER JOIN invoices ON Customers.customerID = invoices.customerID
GROUP BY invoices.customerid

--Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT tracks.name, albums.title, Artists.artistID, tracks.trackid
FROM (
	albums INNER JOIN tracks ON tracks.albumid = albums.albumid
	)
INNER JOIN artists ON albums.artistID = artists.artistID
--where tracks.trackid = 12
ORDER BY tracks.trackid

--Self-relational practice
SELECT A.firstname, B.lastname
FROM employees a, employees b
WHERE (a.firstname = b.firstname) AND (a.lastname = b.lastname)

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT a.lastname AS Manager, b.lastname AS Employee
FROM employees a
INNER JOIN employees b ON b.reportsto = a.employeeid

--Find the name and ID of the artists who do not have albums.
SELECT name
FROM artists
WHERE artists.artistid NOT IN (
		SELECT artistid
		FROM albums
		)

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT lastname
FROM employees

UNION

SELECT lastname
FROM customers
ORDER BY lastname DESC

--See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT customerID
FROM customers
WHERE city NOT IN (
		SELECT BillingCity
		FROM invoices
		)
GROUP BY customerID

--Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. 
--Be sure to make a space in between these two and make it UPPER CASE.
SELECT customerID, firstname, lastname, address, UPPER(city || ' ' || country) AS place
FROM customers

--Create a new employee user id by combining the first 4 letter of the employee’s first name with the first 2 letters of the employee’s last name. 
--Make the new field lower case and pull each individual step to show your work.
SELECT firstname, lastname, Lower(substr(firstname, 1, 4) || substr(lastname, 1, 2)) AS NewID
FROM employees

--	Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT e.LastName, DATE ('now') - e.HireDate AS Tenure
FROM Employees e
WHERE Tenure >= 15
ORDER BY e.LastName ASC

--Profiling the Customers tables, are there any columns with null values?
SELECT count(Total), count(company), count(address), count(postalcode), count(fax), count(firstName), count(phone)
FROM customers
ORDER BY customerID

--Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT customers.firstname || customers.lastname || invoices.invoiceid AS newID
FROM customers
INNER JOIN invoices ON customers.customerID = invoices.customerid
ORDER BY firstname, lastname, invoiceid