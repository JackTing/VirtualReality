class CreateModelCategoryModelLibs < ActiveRecord::Migration
  def change
    create_table :model_category_model_libs do |t|
      t.integer :model_category_id
      t.integer :model_lib_id

      t.timestamps
    end
  end
end
