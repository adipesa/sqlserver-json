use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Modified to remove square brackets and to replace comma before Jr. Renamed CastListing to CastListingArray.</log>
</historylog>
******************************************************************************/

delete
from dbo.CastMembers;

insert into dbo.CastMembers(MovieId,
			    CastMemberName)
select	MovieId,
	SplitColumn.value
from dbo.Movies 
cross apply string_split(replace(replace(replace(replace(Movies.CastListingArray, ',Jr', ' Jr'), ', Jr', ' Jr'), '[', ''), ']', ''),',') as SplitColumn
where Movies.CastListingArray != '[]'

select count(*) as CastMembersCount
from dbo.CastMembers;

