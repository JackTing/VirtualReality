class Project < ActiveRecord::Base
	has_many :project_unity3ds
    has_many :unity3ds, :through => :project_unity3ds
    has_many :user_projects
    has_many :users, :through => :user_projects
    has_many :plan_projects
    has_many :plans, :through => :plan_projects
    has_many :layer_projects
 	has_many :layers,:through=> :layer_projects
    
    mount_uploader :source,ProjectUploader
    resourcify
    rails_admin do
	 	label_plural "项目管理"
	 	configure :layers do
	      # configuration here
	    end
	    list do
	    	field :name do
	    		label "项目名称"
	    	end
	    	field :number do
	    		label "编号"
	    	end
	    	field :source do
	    		label "主模型文件"
	    	end
	    	field :info do
	    		label "项目简介"
	    	end
	    end
	    edit do
	    	field :name do
	    		label "项目名称"
	    	end
	    	field :number do
	    		label "编号"
	    	end
	    	field :source do
	    		label "主模型文件"
	    	end
	    	field :info do
	    		label "项目简介"
	    	end
	    	field :unity3ds do
	    		label "关联进度模型"
	    	end
	    	field :plans do
	    		label "关联进度"
	    	end
	    	field :layers do
	    		label "关联图层"
	    	end
	    end
	end
end
