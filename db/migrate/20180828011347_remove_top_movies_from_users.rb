class RemoveTopMoviesFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :top_movies
  end
end
