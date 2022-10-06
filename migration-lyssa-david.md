
Challenges
Add five entries to the database via the Rails console

*Input*
Movie.create title: "Saw I" , catagory: "horror"
Movie.create title: "Saw II" , catagory: "horror"
Movie.create title: "Saw III" , catagory: "horror"
Movie.create title: "Saw IV" , catagory: "horror"
Movie.create title: "Saw V" , catagory: "horror"
 *Output*
   TRANSACTION (0.6ms)  BEGIN
  Movie Create (0.8ms)  INSERT INTO "movies" ("title", "catagory", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["title", "Saw IV"], ["catagory", "horror"], ["created_at", "2022-10-06 18:44:40.571662"], ["updated_at", "2022-10-06 18:44:40.571662"]]
  TRANSACTION (0.8ms)  COMMIT
  TRANSACTION (0.2ms)  BEGIN
  Movie Create (0.4ms)  INSERT INTO "movies" ("title", "catagory", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["title", "Saw V"], ["catagory", "horror"], ["created_at", "2022-10-06 18:44:40.576703"], ["updated_at", "2022-10-06 18:44:40.576703"]]
  TRANSACTION (0.5ms)  COMMIT
 => 
#<Movie:0x0000000144da8438
 id: 5,
 title: "Saw V",
 catagory: "horror",
 created_at: Thu, 06 Oct 2022 18:44:40.576703000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 18:44:40.576703000 UTC +00:00> 

Create a migration to add a new column to the database called movie_length
*Input*

*Output*

Update the values of the five existing attributes to include a movie_length value
*Input*
in terminal: rails g migration add_movie_length_to_movies
in generated file: add_column :movies, :movie_length, :integer
in terminal: rails db:migrate

*Output*
== 20221006184756 AddMovieLengthToMovies: migrating ===========================
-- add_column(:movies, :movie_length, :integer)
   -> 0.0060s
== 20221006184756 AddMovieLengthToMovies: migrated (0.0060s) ==================



Generate a migration to rename the column 'category' to 'genre'
*Input*
in terminal: rails g migration change_catagory_to_genre_in_movies
in generated file: rename_column(:movies, :catagory, :genre)
in terminal: rails db:migrate


*Output*
== 20221006185303 ChangeCatagoryToGenreInMovies: migrating ====================
-- rename_column(:movies, :catagory, :genre)
   -> 0.0097s
== 20221006185303 ChangeCatagoryToGenreInMovies: migrated (0.0097s) ===========
