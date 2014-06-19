class Texture < ActiveRecord::Base
  #:dependent => :destroy 当单独删除贴图时，相关联的数据也一并删除，但是分类名称并不删除
  has_many :texture_category_textures,:dependent => :destroy
  has_many :texture_categories,:through=> :texture_category_textures
  mount_uploader :image,ImageUploader
  rails_admin do
	 	label_plural "贴图"
	 	parent TextureCategory
	    list do
	    	field :name do
	    		label "分类名称"
	    	end
	    	field :image do
	    		label "贴图"
	    	end
	    end
	    edit do
	    	field :name do
	    		label "分类名称"
	    	end
	    	field :image do
	    		label "贴图"
	    	end
	    	field :texture_categories do
	    		label "所属分类"
	    	end
	    end
	    weight 4
	end
end
