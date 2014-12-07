class AddUsageToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :usage, :integer
  end
end
