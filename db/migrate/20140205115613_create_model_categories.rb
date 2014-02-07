class CreateModelCategories < ActiveRecord::Migration
  def change
    create_table :model_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
