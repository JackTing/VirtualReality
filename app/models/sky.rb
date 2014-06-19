class Sky < ActiveRecord::Base
  has_many :sky_category_skies,:dependent => :destroy
  has_many :sky_categories,:through=> :sky_category_skies
  mount_uploader :image,ModelImageUploader
  mount_uploader :source,SkyUploader

  rails_admin do
		label_plural "背景天空"
		parent SkyCategory
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
	end
end
