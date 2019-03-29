use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/28/2019" bug="" email="adipesa@wellesley.edu">Select cast and genres AS JSON.</log>
    <log revision="1.2" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Renamed CastListing to CastListingArray. Renamed Genres to GenresArray. Removed enclosing double quotes from array elements before inserting.</log>
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
    CastListingArray,
    GenresArray
)
select Title,
       ReleaseYear,
       replace(CastListingArray, '"', '') as CastListingArray,
       replace(GenresArray, '"', '') as GenresArray
from
(
SELECT *
FROM OPENJSON(@movies_json, '$')
WITH(
  Title nvarchar(400) '$.title',  -- case sensitive
  ReleaseYear int '$.year', 
  CastListingArray nvarchar(max) '$.cast' AS JSON, 
  GenresArray nvarchar(max) '$.genres' AS JSON
  )
) as movies_openjson
;

select count(*) as MoviesRowCount
from dbo.Movies;

select top 100 *
from dbo.Movies
where Movies.GenresArray like '%Horror%';
