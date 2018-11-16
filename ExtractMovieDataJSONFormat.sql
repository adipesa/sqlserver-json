use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="11/15/2018" bug="" email="adipesa@wellesley.edu"></log>
</historylog>
******************************************************************************/

-- Typically Formatted Output from SQL Query
select top 10 *
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title;

-- Use FOR JSON AUTO to format output as array of JSON objects
-- Notes name value pairs not included when value is null
select top 10 *
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto;

-- Use INCLUDE_NULL_VALUES option to include name value pairs when value is null
select top 10 *
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto, include_null_values;

-- Alias column names
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as YearOfRelease,
		Director,
		CastListing,
		Genre as Genre,
		Notes as AdditionalInfo
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto, include_null_values;

-- Use FOR JSON PATH and aliases with dot notation to create nested objects
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		Director 'Details.Director',
		CastListing 'Details.CastListing',
		Genre as 'Details.Genre',
		Notes as 'Details.AdditionalInfo'
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path;

-- Use FOR JSON PATH, ROOT to include root node
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		Director 'Details.Director',
		CastListing 'Details.CastListing',
		Genre as 'Details.Genre',
		Notes as 'Details.AdditionalInfo'
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path, root;

-- Use FOR JSON PATH, ROOT() to name root node
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		Director 'Details.Director',
		CastListing 'Details.CastListing',
		Genre as 'Details.Genre',
		Notes as 'Details.AdditionalInfo'
from dbo.Movies
where genre like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path, root('Horror Movies');
