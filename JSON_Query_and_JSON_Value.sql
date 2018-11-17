use TutorialDB
go


/******************************************************************************
<historylog>
    <log revision="1.0" date="11/17/2018" bug="" email="adipesa@wellesley.edu"></log>
</historylog>
******************************************************************************/

declare @horrormovies nvarchar(max)
set @horrormovies = N'{"HorrorMovies" : [ {"Title" : "Friday the 13th", "Villain" : "Jason"}, {"Title" : "Halloween", "Villain" : "Michael Myers"}]}'

select json_query(@horrormovies, '$.HorrorMovies') as HorrorMovies;

select json_value(@horrormovies, '$.HorrorMovies[0].Title') as MovieTitle,
       json_value(@horrormovies, '$.HorrorMovies[0].Villain') as MurderousVillain
union
select json_value(@horrormovies, '$.HorrorMovies[1].Title') as MovieTitle,
       json_value(@horrormovies, '$.HorrorMovies[1].Villain') as MurderousVillain

