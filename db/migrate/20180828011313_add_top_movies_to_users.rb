class AddTopMoviesToUsers < ActiveRecord::Migration[5.2]
  def change
    if !column_exists?(:users, :top_movies)
      add_column :users, :top_movies, :string
    end
  end
end
