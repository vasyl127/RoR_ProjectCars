class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.integer :max_rpm
      t.integer :torque
      t.integer :max_gear
      t.integer :max_speed
      t.integer :deleted, default: 0

      t.timestamps
    end
  end
end
