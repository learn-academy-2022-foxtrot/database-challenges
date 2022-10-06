<!-- Useful Commands
$ rails generate migration action_name_here
$ rails db:migrate
add_column :table_name, :column_name, :datatype
change_column :table_name, :column_name, :datatype
rename_column :table, :old_column, :new_column
remove_column :table_name, :column_name -->
rails db:create

Setup
Create a new Rails application called 'favorite_movies'.
```ruby
> rails new favorite_Movies -d postgresql -T
```
Create the database
```ruby
>rails db:create
```
Generate a Movie model with a title attribute and a category attribute
```ruby
> rails g model Movie title:string category:string 
> rails db:migrate
```

Challenges
Add five entries to the database via the Rails console
```ruby
>rails c
>Movie.create title:'Finding Nemo' category:'animation'
>Movie.create title:'Finding Dory', category:'animation'
>Movie.create title:'Shark Tale' ,category:'animation'
>Movie.create title:'Resident Evil' ,category:'Thriller'
>Movie.create title:'El Camino' ,category:'crime thriller film'
```
Create a migration to add a new column to the database called movie_length
```ruby
>rails generate migration movie_length
#add_column :table_name, :column_name, :datatype

class MovieLength < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :movie_length, :string
  end
end
```
Update the values of the five existing attributes to include a movie_length value
```ruby
> fn = Movie.find 1
> fn
> fn.movie_length = '1h 45m'
>fn.save
>Movie.all
>fd = Movie.find(2)
>fd.update(movie_length:'2h')
>st = Movie.find(3)
> st.update(movie_length:'1h4m')
> re = Movie.find(4)
> re.update(movie_length: '3h')
> ec = Movie.find(5)
> ec.update(movie_length: '2h 35m')

```
Generate a migration to rename the column 'category' to 'genre'
```ruby
> rails generate migration rename_category_to_genre

class RenameCategoryToGenre < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :category, :genre
  end
end

> rails db:migrate

# Didn't work?
```
