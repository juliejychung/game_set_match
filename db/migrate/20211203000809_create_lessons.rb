class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.integer :coach_id
      t.integer :player_id
      t.date :date
      t.time :time
      t.integer :court_id

      t.timestamps
    end
  end
end
