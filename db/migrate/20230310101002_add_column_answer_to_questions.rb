class AddColumnAnswerToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answer_statement, :string, array: true, default: []
    add_column :questions, :good_answer, :string
  end
end
