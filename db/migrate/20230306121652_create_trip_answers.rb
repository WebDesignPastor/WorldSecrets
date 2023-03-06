class CreateTripAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :trip_answers do |t|
      t.string :answer
      t.references :question, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
