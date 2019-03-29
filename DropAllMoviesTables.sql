use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="03/28/2019" bug="" email="adipesa@wellesley.edu"></log>
    <log revision="1.1" date="03/29/2019" bug="" email="adipesa@wellesley.edu">Removed code to drop Directors table - no longer in dataset.</log>
</historylog>
******************************************************************************/

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.CastMembers'))
begin
    drop table dbo.CastMembers
end
go

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.Genres'))
begin
    drop table dbo.Genres
end
go

if exists (
    select *
    from
        sys.tables
    where
        object_id = object_id(N'dbo.Movies'))
begin
    drop table dbo.Movies
end
go

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

