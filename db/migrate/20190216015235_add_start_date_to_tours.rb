class AddStartDateToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :start_date, :date
    add_column :tours, :end_date, :date
    add_column :tours, :pickup, :string
    add_column :tours, :total_seats, :integer
    add_column :tours, :avail_seats, :integer
    add_column :tours, :avail_waitlist, :integer
    add_column :tours, :status, :string
    add_column :tours, :booking_deadline, :datetime
    add_column :tours, :countries, :text
    add_column :tours, :states, :text
  end
end
