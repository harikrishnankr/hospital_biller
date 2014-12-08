class AddBplToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :bpl, :integer
  end
end
