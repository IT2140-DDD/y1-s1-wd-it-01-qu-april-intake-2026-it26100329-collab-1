IF COL_LENGTH('MovieStar', 'rank') IS NULL
BEGIN
    ALTER TABLE MovieStar ADD [rank] INT NULL;
END
GO

DROP PROCEDURE IF EXISTS UpdateStarRanks;
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

DROP TRIGGER IF EXISTS trg_UpdateStarRank;
GO

CREATE TRIGGER trg_UpdateStarRank
ON StarsIn
AFTER INSERT
AS
BEGIN
    EXEC UpdateStarRanks;
END
GO
