class AddCourtReferenceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :matches, :courts
    add_index :matches, :court_id
    change_column_null :matches, :court_id, false
  end
end
