class CreateTexturecategories < ActiveRecord::Migration
  def change
    create_table :texturecategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
