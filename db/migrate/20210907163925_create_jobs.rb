class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user,null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :stipend
      t.timestamps
    end
  end
end
