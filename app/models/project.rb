class Project < ActiveRecord::Base
	has_many :project_unity3ds
    has_many :unity3ds, :through => :project_unity3ds
    has_many :user_projects
    has_many :users, :through => :user_projects
    has_many :plan_projects
    has_many :plans, :through => :plan_projects

    mount_uploader :source,ProjectUploader
    resourcify
    rails_admin do
	 	label_plural "项目管理"
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
	    end
	end
end
