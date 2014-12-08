class AddOtherToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :other, :integer
  end
end
