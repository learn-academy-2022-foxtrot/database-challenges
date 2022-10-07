rails g model Movie title_attribute:string category_attribute:string

Movie.create(title_attribute: 'Lilo & Stitch', category_attribute:'Cartoon')
Movie.create(title_attribute: 'Princess Diaries', category_attribute:'Rom-Com')
Movie.create(title_attribute: 'Death Proof', category_attribute:'Thriller')
Movie.create(title_attribute: 'Hocus Pocus', category_attribute:'Comedy')
Movie.create(title_attribute: 'HalloweenTown', category_attribute:'Fantasy')

<!-- Add five entries to the database via the Rails console
    Movie.create(title_attribute: 'Lilo & Stitch', category_attribute:'Cartoon')
    Movie.create(title_attribute: 'Princess Diaries', category_attribute:'Rom-Com')
    Movie.create(title_attribute: 'Death Proof', category_attribute:'Thriller')
    Movie.create(title_attribute: 'Hocus Pocus', category_attribute:'Comedy')
    Movie.create(title_attribute: 'HalloweenTown', category_attribute:'Fantasy')


Create a migration to add a new column to the database called movie_length

Update the values of the five existing attributes to include a movie_length value
  length = Movie.find(1)
  length.update(movie_length: '1h 25m')

    length = Movie.find(2)
  length.update(movie_length: '1h 30m')

    length = Movie.find(3)
  length.update(movie_length: '2h 10m')

    length = Movie.find(4)
  length.update(movie_length: '1m')

    length = Movie.find(5)
  length.update(movie_length: '42m')

Generate a migration to rename the column 'category' to 'genre' -->
1. rename_column in the terminal first
     ` $rails generate migration rename_column`
2. VS Code: `$rename_column :movies, :category_attribute, :genre`
3. Back to terminal
    rails db:migrate
4. VS Code: Check back Schema