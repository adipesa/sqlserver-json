use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/28/2019" bug="" email="adipesa@wellesley.edu">Renamed Genre to Genres.</log>
    <log revision="1.2" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Removed Director and Notes columns. No longer in dataset.</log>
    <log revision="1.3" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Renamed CastListing to CastListingArray. Renamed Genres to GenresArray.</log>
</historylog>
******************************************************************************/

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.Movies'))
begin
    drop table dbo.Movies
end
GO

CREATE TABLE dbo.Movies(
    MovieId	    	    int identity(1,1) not null primary key,
    Title		        nvarchar(400) null,
    ReleaseYear		    int null,
    CastListingArray	nvarchar(4000) null,
    GenresArray		    nvarchar(400) null
) ON [PRIMARY]
go

/* Insert any indexes here */


select count(*) as MoviesRowCount
from dbo.Movies;

