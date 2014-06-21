class Layer < ActiveRecord::Base
	has_many :layer_unity3ds,:dependent => :destroy
    has_many :unity3ds, :through => :layer_unity3ds
    has_many :layer_projects,:dependent => :destroy
    has_many :projects, :through => :layer_projects

    rails_admin do
 		label_plural "图层管理"
 		parent Unity3d
 		list do
	    	field :projects do
	    		label "所属项目"
	    	end
 			field :name do
	    		label "图层名称"
	    	end
	    	field :unity3ds do
	    		label "关联模型"
	    	end
 		end
 		edit do
 			field :name do
	    		label "图层名称"
	    	end
	    	
	    	field :projects do
	    		label "所属项目"
	    	end

	    	field :unity3ds do
	    		label "关联模型"
	    	end
 		end
    end
end
