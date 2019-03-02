class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :subject
      t.text :content
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
