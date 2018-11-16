use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
</historylog>
******************************************************************************/

delete from dbo.Movies;

declare @movies_json nvarchar(max);

set @movies_json =
(
select MoviesJSON
from dbo.MoviesJSON
where InsertedDate = (select max(InsertedDate) from dbo.MoviesJSON)
);

INSERT INTO dbo.Movies
(
    Title,
    ReleaseYear,
    Director,
    CastListing,
    Genre,
    Notes
)
SELECT *
FROM OPENJSON(@movies_json, '$')
WITH(
  Title nvarchar(400) '$.title',  -- case sensitive
  ReleaseYear int '$.year', 
  Director nvarchar(400) '$.director', 
  CastListing nvarchar(4000) '$.cast', 
  Genre nvarchar(400) '$.genre',
  Notes nvarchar(max) '$.notes' AS JSON
  )
;

select count(*) as MoviesRowCount
from dbo.Movies;

select top 100 *
from dbo.Movies
where Movies.Genre like '%Horror%';
