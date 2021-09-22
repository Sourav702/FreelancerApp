class AddExtraToFreelancers < ActiveRecord::Migration[6.1]
  def change
    add_column :freelancers, :education, :string
    add_column :freelancers, :experience, :string
    add_column :freelancers, :industry, :string
  end
end
