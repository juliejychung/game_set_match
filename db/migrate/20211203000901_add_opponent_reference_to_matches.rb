class AddOpponentReferenceToMatches < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :matches, :users, column: :opponent_id
    add_index :matches, :opponent_id
    change_column_null :matches, :opponent_id, false
  end
end
