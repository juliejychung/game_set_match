class AddPlayerReferenceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :matches, :users, column: :player_id
    add_index :matches, :player_id
    change_column_null :matches, :player_id, false
  end
end
