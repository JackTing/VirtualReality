class Texture < ActiveRecord::Base
  belongs_to :texture_category
  mount_uploader :image,ImageUploader
end
