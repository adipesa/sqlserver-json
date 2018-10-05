use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

delete
from dbo.CastMembers;

insert into dbo.CastMembers(MovieId,
			    CastMemberName)
select	MovieId,
	SplitColumn.value
from dbo.Movies 
cross apply string_split(Movies.CastListing,',') as SplitColumn;

select count(*) as CastMembersCount
from dbo.CastMembers;

