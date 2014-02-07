class CreateSitemenus < ActiveRecord::Migration
  def change
    create_table :sitemenus do |t|
      t.string :name
      t.integer :custom_sort
      t.text :action

      t.timestamps
    end
  end
end
