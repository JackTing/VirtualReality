class ModelLib < ActiveRecord::Base
	has_many :model_category_model_libs
	has_many :model_categories,:through=> :model_category_model_libs
	mount_uploader :source,DesignUnity3dUploader
	mount_uploader :image,ModelImageUploader

	rails_admin do
		label_plural "设计模型"
		parent ModelCategory
		list do
			field :name do
				label "名称"
			end
			field :source do
				label "模型文件"
			end
			field :image do
				label "缩略图"
			end
		end
		edit do
			field :name do
				label "名称"
			end
			field :source do
				label "模型文件"
			end
			field :image do
				label "缩略图"
			end
		end
	end
end
