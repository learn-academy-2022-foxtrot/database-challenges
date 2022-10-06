# Add five entries to the database via the Rails console
Movie.create(title: "The Shining", category: "Horror")
Movie.create(title: "Thor", category: "Action")
Movie.create(title: "The Joker", category: "Drama")
Movie.create(title: "The Batman", category: "Action")
Movie.create(title: "Barbarian", category: "Horror")

# Create a migration to add a new column to the database called movie_length
rails generate migration add_columns_to_movies       
      <!--
    invoke  active_record
    create    db/migrate/20221006213956_add_columns_to_movies.rb 
      -->

<!-- in /migrate -->
add_column :movies, :movie_length, :string

# Update the values of the five existing attributes to include a movie_length value
movie_update = Movie.find 1
movie_update.movie_length = "2hr25min"
movie_update.save

# Generate a migration to rename the column 'category' to 'genre'

rails g migration ChangeNameOfColumnCategoriesToGenre
    <!-- 
    invoke  active_record
    create    db/migrate/20221006215358_change_name_of_column_categories_to_genre.rb
     -->

<!-- In /migrate -->
rename_column(:movies, :category, :genre)

rails db:migrate

Movie.all =

[#<Movie:0x0000000106467ab0                                  
  id: 1,                                                     
  title: "The Shining",                                      
  genre: "Horror",                                           
  created_at: Thu, 06 Oct 2022 21:32:03.130004000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:15.400420000 UTC +00:00,
  movie_length: "2hrs">,                                     
 #<Movie:0x000000010659c6b0                                  
  id: 2,                                                     
  title: "Thor",                                             
  genre: "Action",                                           
  created_at: Thu, 06 Oct 2022 21:34:17.488165000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:45:07.237206000 UTC +00:00,
  movie_length: "1hr45">,
 #<Movie:0x000000010659c570
  id: 3,
  title: "The Joker",
  genre: "Drama",
  created_at: Thu, 06 Oct 2022 21:34:50.677232000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:45:46.351817000 UTC +00:00,
  movie_length: "2hr25min">,
 #<Movie:0x000000010659c430
  id: 4,
  title: "The Batman",
  genre: "Action",
  created_at: Thu, 06 Oct 2022 21:35:17.715008000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:46:19.932202000 UTC +00:00,
  movie_length: "2hrs5min">,
 #<Movie:0x000000010659c2f0
  id: 5,
  title: "Barbarian",
  genre: "Horror",
  created_at: Thu, 06 Oct 2022 21:35:59.963547000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:46:45.752420000 UTC +00:00,
  movie_length: "1hr55min">] 