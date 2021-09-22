class AddPicToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :image, :file
  end
end
