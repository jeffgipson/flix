class AddTopMoviesArrayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :top_movies, :string, default: [], array: true
  end
end
