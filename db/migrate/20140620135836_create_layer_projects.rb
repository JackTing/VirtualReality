class CreateLayerProjects < ActiveRecord::Migration
  def change
    create_table :layer_projects do |t|
      t.integer :layer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
