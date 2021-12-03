class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :state
      t.string :city
      t.text :neighborhood
      t.string :email
      t.string :password
      t.string :level
      t.string :gender
      t.integer :age
      t.string :profile_picture
      t.boolean :coach
      t.integer :cost_per_hour

      t.timestamps
    end
  end
end
