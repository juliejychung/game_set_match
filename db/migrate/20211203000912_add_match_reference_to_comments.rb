class AddMatchReferenceToComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :comments, :matches
    add_index :comments, :match_id
    change_column_null :comments, :match_id, false
  end
end
