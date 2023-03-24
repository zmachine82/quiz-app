class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :quiz_test, null: false, foreign_key: true
      t.string :text
      t.string :question_type

      t.timestamps
    end
  end
end
