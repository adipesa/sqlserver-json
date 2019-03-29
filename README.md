# sqlserver-json
# This repository contains the content for the SQL Server and JSON - It's Not a Horror Movie! presentation
# at SQL Saturday 813 Boston BI - March, 2019
# Before running the queries in the ExtractMovieDataJSONFOrmat.sql file, you will need to:
# - Restore the TutorialDB database onto a SQL Server 2016 or above instance from the TutorialDB.bck backup file
#
# Alternatively, you can build and populate the tables in an empty TutorialDB database, as follows:
# - Download wikipedia-movie-data-master from https://github.com/prust/wikipedia-movie-data
# - and copy the movies.json file to C:\Presentations\SQL Saturday Boston BI\wikipedia-movie-data-master\movies.json
# - Run the following SQL scripts to create the needed tables:
#   - CreateMoviesJSON.sql
#   - CreateMovies.sql
#   - CreateGenres.sql
#   - CreateCastMembers.sql
# - Run the following SQL script to load the movie data into a single row in the MoviesJSON table
#   - InsertMoviesJSON.sql
# - Run the following SQL script to view a tabular representation of the movie data in the MoviesJSON table
#   - ListMoviesTabular.sql
# - Run the following SQL script to insert data into the Movies table based on the JSON in the row in the MoviesJSON table
#   - InsertMovies.sql
# - Run the following SQL scripts to populate data into the other needed tables:
#   - InsertGenres.sql
#   - InsertCastMembers.sql
# - After completing the above steps, you should be able to run the queries in the ExtractMovieDataJSONFOrmat.sql file
#
#
# - If you want to drop the tables from the TutorialDB database, simply run the SQL script:
#   - DropAllMoviesTables.sql
#
