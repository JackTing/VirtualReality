class Plan < ActiveRecord::Base
	has_many :plan_unity3ds
    has_many :unity3ds, :through => :plan_unity3ds

    has_many :plan_projects
    has_many :projects,:through=> :plan_projects

	resourcify

	rails_admin do
  		label_plural '计划管理'
        parent Unity3d
  		list do
    		field :wbsno do
    			label "序号"
    		end
    		field :wbsname do
    			label "工程名称"
    		end
    		field :quantitiesplan do
    			label "计划工作量"
    		end
    		field :quantitiesfact do
    			label "完成工作量"
    		end
    		field :wbspctcomp do
    			label "完成百分比"
    		end
            field :projects do
                label "隶属项目"
            end
    	end
    	edit do
    		field :wbsno do
    			label "序号"
    		end
    		field :wbsname do
    			label "工程名称"
    		end
    		field :quantitiesplan do
    			label "计划工作量"
    		end
    		field :quantitiesfact do
    			label "完成工作量"
    		end
    		field :wbspctcomp do
    			label "完成百分比"
    		end
    		field :projects do 

    			label "关联项目"
    		end

    	end
  	end
end
