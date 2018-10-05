use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

delete
from dbo.Genres;

insert into dbo.Genres( MovieId,
			GenreName)
select	MovieId,
	SplitColumn.value
from dbo.Movies 
cross apply string_split(Movies.Genre,',') as SplitColumn;

select count(*) as GenresCount
from dbo.Genres;

