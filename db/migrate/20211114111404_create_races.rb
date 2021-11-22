class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name
      t.text :description
      t.integer :deleted, default: 0

      t.timestamps
    end
  end
end
