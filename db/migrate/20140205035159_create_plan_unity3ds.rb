class CreatePlanUnity3ds < ActiveRecord::Migration
  def change
    create_table :plan_unity3ds do |t|
      t.integer :plan_id
      t.integer :unity3d_id

      t.timestamps
    end
  end
end
