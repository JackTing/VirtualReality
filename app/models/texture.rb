class Texture < ActiveRecord::Base
  belongs_to :texturecategory
  mount_uploader :image,ImageUploader
end
