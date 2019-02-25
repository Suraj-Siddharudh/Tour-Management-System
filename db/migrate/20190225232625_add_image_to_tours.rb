class AddImageToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :image, :string
  end
end
