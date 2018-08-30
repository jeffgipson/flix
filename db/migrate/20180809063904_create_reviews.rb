class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :review
      t.float :rating
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
