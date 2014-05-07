class CreateSkyCategories < ActiveRecord::Migration
  def change
    create_table :sky_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
