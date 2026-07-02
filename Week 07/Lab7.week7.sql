ALTER TABLE MovieStar ADD [rank] INT NULL;
GO

CREATE PROCEDURE UpdateStarRanks
AS
BEGIN
    ;WITH LeadRoleCounts AS (
        SELECT starname, COUNT(*) AS leadCount
        FROM StarsIn
        WHERE role = 'Lead'
        GROUP BY starname
    ),
    RankedStars AS (
        SELECT starname, RANK() OVER (ORDER BY leadCount DESC) AS starRank
        FROM LeadRoleCounts
    )
    UPDATE ms
    SET ms.[rank] = rs.starRank
    FROM MovieStar ms
    JOIN RankedStars rs ON ms.name = rs.starname;
END
GO

CREATE TRIGGER trg_UpdateStarRank
ON StarsIn
AFTER INSERT
AS
BEGIN
    EXEC UpdateStarRanks;
END
GO
