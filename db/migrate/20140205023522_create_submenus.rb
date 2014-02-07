class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :name
      t.integer :custom_sort
      t.text :action
      t.references :sitemenu,index: true

      t.timestamps
    end
  end
end
