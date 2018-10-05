use TutorialDB
go

/******************************************************************************
<historylog>
    <log revision="1.0" date="10/05/2018" bug="" email="Tony DiPesa">Developed by Wellesley College.</log>

</historylog>
******************************************************************************/

drop table dbo.MoviesJSON;
go

create table dbo.MoviesJSON
(MoviesJSONId 			int identity(1,1) not null primary key,
 MoviesJSON 			nvarchar(max) not null,
 MoviesJSONNoArrayWrapper	nvarchar(max) null,
 InsertedDate			datetime not null default getdate());
go
