class CreateRaceCars < ActiveRecord::Migration[6.1]
  def change
    create_table :race_cars do |t|
      t.integer :race_id
      t.integer :car_id

      t.timestamps
    end
  end
end
