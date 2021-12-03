class CreateCourts < ActiveRecord::Migration[6.0]
  def change
    create_table :courts do |t|
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :name

      t.timestamps
    end
  end
end
