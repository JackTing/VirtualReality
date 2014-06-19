class Unity3d < ActiveRecord::Base
 
 has_many :plan_unity3ds
 has_many :plans, :through => :plan_unity3ds

 has_many :layer_unity3ds
 has_many :layers, :through => :layer_unity3ds

 has_many :project_unity3ds
 has_many :projects,:through=> :project_unity3ds

 has_many :infos,:dependent => :destroy
 mount_uploader :source,Unity3dUploader

 rails_admin do
    navigation_label "进度与模型管理"
 	label_plural "进度模型"
    list do
    	field :name do
    		label "工程名称"
    	end
    	field :category do
    		label "工种"
    	end
    	field :objectname do
    		label "模型名称"
    	end
    	field :use do
    		label "是否使用"
    	end
    	field :option do
    		label "选项"
    	end
    	field :plan do
    		label "是否参与进度"
    	end
    	field :num do
    		label "子物体数量"
    	end
        field :project do
            label "所属项目"
        end
    end
    edit do
      field :name do
    		label "工程名称"
    	end
    	field :category do
    		label "工种"
    	end
    	field :objectname do
    		label "模型名称"
    	end
    	field :use do
    		label "是否使用"
    	end
    	field :option do
    		label "选项"
    	end
    	field :plan do
    		label "是否参与进度"
    	end
    	field :num do
    		label "子物体数量"
    	end
    	field :source do
    		label "三维物体"
    	end
    	field :projects do
    		label "所属项目"
    	end
        field :plans do
            label "关联进度"
        end
        field :infos do
            label "信息"
        end
    end
     weight 0
  end

 resourcify
end
