class AddCategoryIdToEquips < ActiveRecord::Migration
  def change
    add_column :equips, :category_id, :integer
  end
end
