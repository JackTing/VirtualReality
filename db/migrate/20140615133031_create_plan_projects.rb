class CreatePlanProjects < ActiveRecord::Migration
  def change
    create_table :plan_projects do |t|
      t.integer :plan_id
      t.integer :project_id

      t.timestamps
    end
  end
end
