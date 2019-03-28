use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/27/2019" bug="" email="adipesa@wellesley.edu">Updated for SQL Saturday Boston BI.</log>
</historylog>
******************************************************************************/

delete
from dbo.MoviesJSON;

insert into dbo.MoviesJSON(MoviesJSON)
select MoviesData.*
   from openrowset (bulk 'C:\Presentations\SQL Saturday Boston BI\wikipedia-movie-data-master\movies.json', single_clob) as MoviesData;

select count(*) as MoviesJSONRowCount
from dbo.MoviesJSON;

select ISJSON(MoviesJSON) IsJSON, MoviesJSON, len(MoviesJSON) as LengthMoviesJSON
from dbo.MoviesJSON;
