class AddMovieLengthToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :movie_length, :string 
  end
end
