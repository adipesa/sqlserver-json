use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
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
    MovieId		int identity(1,1) not null primary key,
    Title		nvarchar(400) null,
    ReleaseYear		int null,
    Director		nvarchar(400) null,
    CastListing		nvarchar(4000) null,
    Genre		nvarchar(400) null,
    Notes		nvarchar(max) null
) ON [PRIMARY]
go

/* Insert any indexes here */


select count(*) as MoviesRowCount
from dbo.Movies;

