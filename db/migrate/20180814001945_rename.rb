class Rename < ActiveRecord::Migration[5.2]
  def change


    rename_column :reviews, :review, :movie_review

  end
end
