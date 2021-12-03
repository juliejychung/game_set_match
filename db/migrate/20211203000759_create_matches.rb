class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :player_id
      t.integer :opponent_id
      t.date :date
      t.time :time
      t.integer :court_id

      t.timestamps
    end
  end
end
