class Info < ActiveRecord::Base
  belongs_to :unity3d
  mount_uploader :image,InfoImageUploader
  	rails_admin do
	 	label_plural "模型信息"
	 	parent Unity3d
	    list do
	    	field :key do
	    		label "属性名称"
	    	end
	    	field :value do
	    		label "属性值"
	    	end
	    	field :image do
	    		label "属性示意图"
	    	end
	    end
	    edit do
	    	field :key do
	    		label "属性名称"
	    	end
	    	field :value do
	    		label "属性值"
	    	end
	    	field :image do
	    		label "属性示意图"
	    	end
	    end
	end
end
