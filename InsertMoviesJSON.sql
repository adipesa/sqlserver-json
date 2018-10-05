use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

delete
from dbo.MoviesJSON;

insert into dbo.MoviesJSON(MoviesJSON)
select MoviesData.*
   from openrowset (bulk 'C:\Presentations\Boston Code Camp\wikipedia-movie-data-master\movies.json', single_clob) as MoviesData;

select count(*) as MoviesJSONRowCount
from dbo.MoviesJSON;

select ISJSON(MoviesJSON) IsJSON, MoviesJSON, len(MoviesJSON) as LengthMoviesJSON
from dbo.MoviesJSON;
