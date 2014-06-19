class TextureCategory < ActiveRecord::Base
	#:dependent => :destroy当删除分类名称时，相关联的数据一并删除，但是贴图并不删除
	has_many :texture_category_textures,:dependent => :destroy
    has_many :textures, :through => :texture_category_textures

    rails_admin do
	    navigation_label "贴图管理"
	 	label_plural "贴图分类"
	    list do
	    	field :name do
	    		label "分类名称"
	    	end
	    end
	    edit do
	    	field :name do
	    		label "分类名称"
	    	end
	    end
	    weight 3
	end
end
