class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
      t.string :category
      t.string :equip
      t.integer :qty
      t.integer :unit_price
      t.integer :total_price

      t.timestamps
    end
  end
end
