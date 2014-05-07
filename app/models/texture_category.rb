class TextureCategory < ActiveRecord::Base
	#:dependent => :destroy当删除分类名称时，相关联的数据一并删除，但是贴图并不删除
	has_many :texture_category_textures,:dependent => :destroy
    has_many :textures, :through => :texture_category_textures
end
