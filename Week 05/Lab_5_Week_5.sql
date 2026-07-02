SELECT DISTINCT ms.name
FROM MovieStar ms
JOIN StarsIn si ON ms.name = si.starname
JOIN Movie m ON si.movieTitle = m.title AND si.movieYear = m.year
WHERE m.directorName = 'Jon Watts';

SELECT s.movieTitle, SUM(s.spectators) AS totalSpectators
FROM Show s
JOIN Theater t ON s.theaterName = t.theaterName
WHERE t.city = 'LA'
GROUP BY s.movieTitle;

SELECT b.custName
FROM Booking b
JOIN Show s ON b.showId = s.showId
GROUP BY b.custName
HAVING COUNT(DISTINCT s.movieTitle) > 1;

SELECT s.theaterName, SUM(s.ticketPrice * s.spectators) AS totalIncome
FROM Show s
GROUP BY s.theaterName
HAVING SUM(s.ticketPrice * s.spectators) > 50000;

SELECT b.custName
FROM Booking b
JOIN Show s ON b.showId = s.showId
GROUP BY b.custName
HAVING COUNT(DISTINCT s.theaterName) > 1;
