class CreateModelLibs < ActiveRecord::Migration
  def change
    create_table :model_libs do |t|
      t.string :name
      t.string :source

      t.timestamps
    end
  end
end
