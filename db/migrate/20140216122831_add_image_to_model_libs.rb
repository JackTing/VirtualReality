class AddImageToModelLibs < ActiveRecord::Migration
  def change
    add_column :model_libs, :image, :string
  end
end
