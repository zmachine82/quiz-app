class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.boolean :correct
      t.string :text

      t.timestamps
    end
  end
end
