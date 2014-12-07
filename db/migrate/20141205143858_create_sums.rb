class CreateSums < ActiveRecord::Migration
  def change
    create_table :sums do |t|
      t.integer :total

      t.timestamps
    end
  end
end
