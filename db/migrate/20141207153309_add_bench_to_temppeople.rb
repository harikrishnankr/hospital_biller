class AddBenchToTemppeople < ActiveRecord::Migration
  def change
    add_column :temppeople, :bench, :string
  end
end
