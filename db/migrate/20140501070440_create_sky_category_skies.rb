class CreateSkyCategorySkies < ActiveRecord::Migration
  def change
    create_table :sky_category_skies do |t|
      t.integer :sky_id
      t.integer :sky_category_id

      t.timestamps
    end
  end
end
