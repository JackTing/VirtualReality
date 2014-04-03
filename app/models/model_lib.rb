class ModelLib < ActiveRecord::Base
	has_many :model_category_model_libs
    has_many :model_categories, :through => :model_category_model_libs

    mount_uploader :source,DesignUnity3dUploader
    mount_uploader :image,ModelImageUploader
 	resourcify
end
