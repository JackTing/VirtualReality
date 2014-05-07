class CreateTextureCategoryTextures < ActiveRecord::Migration
  def change
    create_table :texture_category_textures do |t|
      t.integer :texture_category_id
      t.integer :texture_id

      t.timestamps
    end
  end
end
