class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :is_agent, :integer
    add_column :users, :is_customer, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
