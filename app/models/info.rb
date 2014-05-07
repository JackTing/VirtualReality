class Info < ActiveRecord::Base
  belongs_to :unity3d
  mount_uploader :image,InfoImageUploader
end
