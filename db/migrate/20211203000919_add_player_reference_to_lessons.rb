class AddPlayerReferenceToLessons < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lessons, :users, column: :player_id
    add_index :lessons, :player_id
    change_column_null :lessons, :player_id, false
  end
end
