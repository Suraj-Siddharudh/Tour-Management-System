class AddPhoneNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :access_control, :integer
    add_column :users, :name, :string
  end
end
