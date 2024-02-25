class CreatePois < ActiveRecord::Migration[7.0]
  def change
    create_table :pois do |t|
      t.string :name
      t.string :address
      t.string :mystery_name
      t.text :mystery_content
      t.string :mystery_image
      t.string :clue_image
      t.string :clue_sentence

      t.timestamps
    end
  end
end
