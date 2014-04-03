class CreateLayerUnity3ds < ActiveRecord::Migration
  def change
    create_table :layer_unity3ds do |t|
      t.integer :layer_id
      t.integer :unity3d_id

      t.timestamps
    end
  end
end
