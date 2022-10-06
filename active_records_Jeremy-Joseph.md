## db/migrate/20221006185123_create_movies.rb
```ruby
class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
```
--- 
## db/migrate/20221006213801_add_new_column_movie_length.rb
```ruby
class AddNewColumnMovieLength < ActiveRecord::Migration[7.0]
  def change
    #cmd       #table,      #:column,   #:column_data_type
    add_column :movies, :movie_length, :string
  end
end
```
---
## db/migrate/20221006215445_rename_category_to_genre.rb
```ruby
class RenameCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
    #rename_column :table, :old_column, :new_column
    rename_column :movies, :category, :genre
  end
end
```
---




## db/schema results
```ruby
ActiveRecord::Schema[7.0].define(version: 2022_10_06_215445) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movie_length"
  end

end
```
---
## console results
```ruby
3.1.2 :001 > Movie.all
  Movie Load (0.6ms)  SELECT "movies".* FROM "movies"
 =>
[#<Movie:0x00000001088b7758
  id: 5,
  title: "Donnie Darko",
  genre: "Psychological Drama",
  created_at: Thu, 06 Oct 2022 21:30:02.185402000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:52:16.478704000 UTC +00:00,
  movie_length: "1h 53m">,
 #<Movie:0x00000001083049a0
  id: 4,
  title: "Night Crawler",
  genre: "Psychological / Thriller",
  created_at: Thu, 06 Oct 2022 21:28:58.979437000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:52:43.087564000 UTC +00:00,
  movie_length: "1h 57m">,
 #<Movie:0x00000001083047e8
  id: 3,
  title: "Thor: Love and Thunder",
  genre: "Action",
  created_at: Thu, 06 Oct 2022 21:27:24.492305000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:52:51.545828000 UTC +00:00,
  movie_length: "1h 59m">,
 #<Movie:0x00000001083046f8
  id: 2,
  title: "Top Gun Maverick",
  genre: "Action / Drama",
  created_at: Thu, 06 Oct 2022 21:26:41.618914000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:53:03.888051000 UTC +00:00,
  movie_length: "2h 11m">,
 #<Movie:0x0000000108304478
  id: 1,
  title: "Alien",
  genre: "Sci-Fi / Horror",
  created_at: Thu, 06 Oct 2022 21:26:03.898359000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:53:18.014795000 UTC +00:00,
  movie_length: "1h 57m">]
```