class AddCourtReferenceToLessons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lessons, :courts
    add_index :lessons, :court_id
    change_column_null :lessons, :court_id, false
  end
end
