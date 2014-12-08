class AddBenchToPeople < ActiveRecord::Migration
  def change
    add_column :people, :bench, :string
  end
end
