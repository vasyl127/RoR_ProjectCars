class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name
      t.text :description
      t.integer :car_id, array: true, default: []

      t.timestamps
    end
  end
end
