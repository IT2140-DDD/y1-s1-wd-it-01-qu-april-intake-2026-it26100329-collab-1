CREATE VIEW MovieTheaterCount AS
SELECT m.title, m.year, m.directorName, COUNT(DISTINCT s.theaterName) AS numTheaters
FROM Movie m
JOIN Show s ON m.title = s.movieTitle
GROUP BY m.title, m.year, m.directorName;
GO

CREATE VIEW TheaterMovieCount AS
SELECT t.theaterName, t.city, COUNT(DISTINCT s.movieTitle) AS totalMovies
FROM Theater t
JOIN Show s ON t.theaterName = s.theaterName
GROUP BY t.theaterName, t.city;
GO

CREATE FUNCTION GetMovieCountByStar(@starName VARCHAR(15))
RETURNS INT
AS
BEGIN
    DECLARE @movieCount INT;
    SELECT @movieCount = COUNT(DISTINCT movieTitle)
    FROM StarsIn
    WHERE starname = @starName;
    RETURN @movieCount;
END
GO

CREATE FUNCTION GetTotalSpectators(@theater VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @totalSpectators INT;
    SELECT @totalSpectators = SUM(spectators)
    FROM Show
    WHERE theaterName = @theater;
    RETURN @totalSpectators;
END
GO
