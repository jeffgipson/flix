class AddCoverImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cover_image, :string
  end
end
