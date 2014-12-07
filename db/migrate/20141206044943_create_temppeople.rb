class CreateTemppeople < ActiveRecord::Migration
  def change
    create_table :temppeople do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :opno
      t.string :ipno
      t.string :wardno
      t.string :address

      t.timestamps
    end
  end
end
