class CreateUnity3ds < ActiveRecord::Migration
  def change
    create_table :unity3ds do |t|
      t.string :name
      t.string :category
      t.string :objectname
      t.string :source
      t.boolean :use
      t.boolean :plan
      t.integer :num
      t.text :option
      t.timestamps
    end
  end
end
