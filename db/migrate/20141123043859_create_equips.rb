class CreateEquips < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.integer :category_id
      t.string :serial_no
      t.string :name
      t.integer :cost
      t.integer :usage ,:default=>0
      t.integer :bpl
      t.integer :other
      t.timestamps
    end
  end
end
