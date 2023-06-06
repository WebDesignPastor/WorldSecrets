class AddColumnNameToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :name, :string
  end
end
