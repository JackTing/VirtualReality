class CreateProjectUnity3ds < ActiveRecord::Migration
  def change
    create_table :project_unity3ds do |t|
      t.integer :project_id
      t.integer :unity3d_id

      t.timestamps
    end
  end
end
