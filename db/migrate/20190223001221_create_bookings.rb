class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :no_of_seats
      t.references :users, foreign_key: true
      t.references :tours, foreign_key: true

      t.timestamps
    end
  end
end
