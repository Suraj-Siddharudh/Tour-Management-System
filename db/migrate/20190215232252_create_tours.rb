class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :Name
      t.text :Description
      t.float :Price

      t.timestamps
    end
  end
end
