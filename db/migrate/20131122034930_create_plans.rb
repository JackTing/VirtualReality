class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :wbsno
      t.string :wbsname
      t.integer :quantitiesplan
      t.integer :quantitiesfact
      t.integer :wbspctcomp
      
      t.timestamps
    end
  end
end
