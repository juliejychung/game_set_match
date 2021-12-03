class AddCoachReferenceToLessons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lessons, :users, column: :coach_id
    add_index :lessons, :coach_id
    change_column_null :lessons, :coach_id, false
  end
end
