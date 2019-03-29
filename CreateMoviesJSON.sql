use TutorialDB
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="11/16/2018" bug="" email="adipesa@wellesley.edu">Added drop if exists and count.</log>
    <log revision="1.2" date="03/28/2019" bug="" email="adipesa@wellesley.edu">Removed MoviesJSONNoArrayWrapper column.</log>
</historylog>
******************************************************************************/

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.MoviesJSON'))
begin
    drop table dbo.MoviesJSON
end
go

create table dbo.MoviesJSON
(MoviesJSONId 			int identity(1,1) not null primary key,
 MoviesJSON 			nvarchar(max) not null,
 InsertedDate			datetime not null default getdate());
go

/* Insert any indexes here */


select count(*) as MoviesJSONRowCount
from dbo.MoviesJSON;
