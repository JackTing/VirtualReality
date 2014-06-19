
class ModelCategory < ActiveRecord::Base
	has_many :model_category_model_libs,:dependent => :destroy
    has_many :model_libs, :through => :model_category_model_libs

    rails_admin do
    	navigation_label "设计模型管理"
	 	label_plural "设计模型分类"
	    list do
	    	field :name do
	    		label "分类名称"
	    	end
	    end
	    edit do
	    	field :name do
	    		label "分类名称"
	    	end
	    	field :model_libs do
	    		label "关联模型"
	    	end
	    end
	    weight 1
	 end
end

