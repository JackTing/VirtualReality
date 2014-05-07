class Sky < ActiveRecord::Base
  has_many :sky_category_skies,:dependent => :destroy
  has_many :sky_categories,:through=> :sky_category_skies
  mount_uploader :image,ModelImageUploader
  mount_uploader :source,SkyUploader
end
