class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :address
      t.string :opno
      t.string :ipno
      t.string :wardno
      t.string :billno
      t.integer :cost
      t.string :bench
      t.timestamps
    end
  end
end
