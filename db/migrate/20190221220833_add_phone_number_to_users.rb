class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :access_control, :integer, :default => "2"
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
