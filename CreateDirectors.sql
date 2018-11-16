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
        object_id = object_id(N'dbo.Directors'))
begin
    drop table dbo.Directors
end
GO

CREATE TABLE dbo.Directors(
    DirectorId		int identity(1,1) not null primary key,
    MovieId		int not null foreign key references dbo.Movies(MovieId),
    DirectorName	nvarchar(400) null,
) ON [PRIMARY]
go

/* Insert any indexes here */


select count(*) as DirectorsRowCount
from dbo.Directors;

