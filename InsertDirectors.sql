use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

delete
from dbo.Directors;

insert into dbo.Directors(MovieId,
			  DirectorName)
select	MovieId,
	SplitColumn.value
from dbo.Movies 
cross apply string_split(Movies.Director,',') as SplitColumn;

select count(*) as DirectorsCount
from dbo.Directors;

