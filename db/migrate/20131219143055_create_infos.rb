class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :key
      t.text :value
      t.references :unity3d, index: true

      t.timestamps
    end
  end
end
