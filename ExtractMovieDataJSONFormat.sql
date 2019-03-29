use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="11/15/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="11/17/2018" bug="" email="adipesa@wellesley.edu">Select only one row for without_array_wrapper_example.</log>
    <log revision="1.2" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Modified for updated table structures.</log>
</historylog>
******************************************************************************/

-- Typically Formatted Output from SQL Query
select top 10 *
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title

-- Replace [] with null
select top 10
		Title,
		ReleaseYear,
		case when CastListingArray = '[]'
			 then null
			 else CastListingArray
		end as CastListingArray,
		case when GenresArray = '[]'
			 then null
			 else GenresArray
		end as GenresArray
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title


-- Replace [] with null
select top 10
		Title,
		ReleaseYear,
		case when CastListingArray = '[]'
			 then null
			 else CastListingArray
		end as CastListingArray,
		case when GenresArray = '[]'
			 then null
			 else GenresArray
		end as GenresArray,
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title

-- Use FOR JSON AUTO to format output as array of JSON objects
-- Note name value pairs not included when value is null
select top 10 *
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto;

-- Use INCLUDE_NULL_VALUES option to include name value pairs when value is null
select top 10 *
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto, include_null_values;

-- Alias column names
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as YearOfRelease,
		CastListingArray as Actors,
		GenresArray as Genres
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json auto, include_null_values;

-- Use FOR JSON PATH and aliases with dot notation to create nested JSON objects
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		CastListingArray 'Details.Actors',
		GenresArray as 'Details.Genre'
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path;

-- Use FOR JSON PATH, return array of one JSON object
select 	MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		CastListingArray 'Details.Actors',
		GenresArray as 'Details.Genre'
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
and Title = 'Motel Hell'
order by Title
for json path;

-- Use FOR JSON PATH, WITHOUT_ARRAY_WRAPPER to return JSON object only (rather than array of one object)
select 	MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		CastListingArray 'Details.Actors',
		GenresArray as 'Details.Genre'
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
and Title = 'Motel Hell'
order by Title
for json path, without_array_wrapper;

-- Use FOR JSON PATH, ROOT to include root node
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		CastListingArray 'Details.Actors',
		GenresArray as 'Details.Genre'
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path, root;

-- Use FOR JSON PATH, ROOT() to name root node
select top 10
		MovieId as Id,
		Title as Film,
		ReleaseYear as 'Details.YearOfRelease',
		CastListingArray 'Details.Actors',
		GenresArray as 'Details.Genre'
from dbo.Movies
where GenresArray like '%Horror%'
and ReleaseYear = 1980
order by Title
for json path, root('Horror Movies');
