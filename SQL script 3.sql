BEGIN
    DROP TABLE AccidentDate
END

GO;

CREATE TABLE AccidentDate (
    accident_id VARCHAR(50),
    accident_ooc_at VARCHAR(50)
)

GO;

INSERT INTO AccidentDate(accident_id, accident_ooc_at)
SELECT ID, TRY_CONVERT(DATE, LEFT(Start_Time, 10)) AS accident_ooc_at
FROM staging_accidents

GO;

SELECT TOP 100 * FROM AccidentDate

GO;