class AddEmailConfirmColumnToFreelancers < ActiveRecord::Migration[6.1]
  def change
    add_column :freelancers, :email_confirmed, :boolean, :default => false
    add_column :freelancers, :confirm_token, :string
  end
end
