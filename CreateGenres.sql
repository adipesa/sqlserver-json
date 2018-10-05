use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>
</historylog>
******************************************************************************/

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.Genres'))
begin
    drop table dbo.Genres
end
GO

CREATE TABLE dbo.Genres(
    GenreId	int identity(1,1) not null primary key,
    MovieId	int not null foreign key references dbo.Movies(MovieId),
    GenreName	nvarchar(400) null,
) ON [PRIMARY]
go

/* Insert any indexes here */


select count(*) as GenresRowCount
from dbo.Genres;

