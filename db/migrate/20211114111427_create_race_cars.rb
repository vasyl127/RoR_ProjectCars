class CreateRaceCars < ActiveRecord::Migration[6.1]
  def change
    create_table :race_cars do |t|
      t.belongs_to :race, null: false, foreign_key: true
      t.belongs_to :car, null: false, foreign_key: true

      t.timestamps
    end

    add_index :race_cars, [:race_id, :car_id], unique: true
  end
end
