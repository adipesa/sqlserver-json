use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Modified to remove square brackets. Renamed Genres to GenresArray.</log>
</historylog>
******************************************************************************/

delete
from dbo.Genres;

insert into dbo.Genres( MovieId,
			GenreName)
select	MovieId,
	SplitColumn.value
from dbo.Movies 
cross apply string_split(replace(replace(Movies.GenresArray, '[', ''), ']', ''),',') as SplitColumn
where Movies.GenresArray != '[]'

select count(*) as GenresCount
from dbo.Genres;

