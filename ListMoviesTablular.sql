use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="03/29/2019" bug="" email="adipesa@wellesley.edu"></log>
</historylog>
******************************************************************************/

declare @movies_json nvarchar(max);

set @movies_json =
(
select MoviesJSON
from dbo.MoviesJSON
where InsertedDate = (select max(InsertedDate) from dbo.MoviesJSON)
);

select Title,
       ReleaseYear,
       CastListingArray,
       GenresArray
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
