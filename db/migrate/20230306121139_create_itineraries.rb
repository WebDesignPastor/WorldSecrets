class CreateItineraries < ActiveRecord::Migration[7.0]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.float :distance
      t.float :rating
      t.integer :duration
      t.integer :number_of_poi
      t.string :departure
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
