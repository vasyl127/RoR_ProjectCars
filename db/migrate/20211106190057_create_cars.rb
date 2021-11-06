class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.integer :rpm
      t.integer :max_rpm
      t.integer :gear
      t.integer :max_gear
      t.integer :speed
      t.integer :max_speed
      t.integer :torque
      t.integer :odo

      t.timestamps
    end
  end
end
