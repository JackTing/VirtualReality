class CreateTextureCategories < ActiveRecord::Migration
  def change
    create_table :texture_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
