class CreateGuitars < ActiveRecord::Migration
  def change
    create_table :guitars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.string :serial
      t.string :color
      t.string :cost
      t.string :notes

      t.timestamps null: false
    end
  end
end
