class Texture < ActiveRecord::Base
  #:dependent => :destroy 当单独删除贴图时，相关联的数据也一并删除，但是分类名称并不删除
  has_many :texture_category_textures,:dependent => :destroy
  has_many :texture_categories,:through=> :texture_category_textures
  mount_uploader :image,ImageUploader
end
