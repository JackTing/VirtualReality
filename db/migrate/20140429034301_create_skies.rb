class CreateSkies < ActiveRecord::Migration
  def change
    create_table :skies do |t|
      t.string :name
      t.string :source
      t.string :image

      t.timestamps
    end
  end
end
