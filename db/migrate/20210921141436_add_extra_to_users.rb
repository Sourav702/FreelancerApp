class AddExtraToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :industry, :string,null: false
  end
end
