class Sitemenu < ActiveRecord::Base
	#:dependent => :destroy当主表数据删除时，关联数据表也一起删除
	has_many :submenus,:dependent => :destroy
	belongs_to :project
	resourcify
	rails_admin do
	    navigation_label "菜单管理"
	  	label_plural "主菜单"
	    list do
	      field :project do
	      	label "所属项目"
	      end
	      field :name do
	        label "菜单名称"
	      end
	      field :action do
	      	label "动作"
	      end
	      field :custom_sort do
	      	label "自定义排序"
	      end
	      field :submenus do
	      	label "子菜单"
	      end
	  	end
	  	edit do
	  	  field :project do
	      	label "所属项目"
	      end
	      field :name do
	        label "菜单名称"
	      end
	      field :action do
	      	label "动作"
	      end
	      field :custom_sort do
	      	label "自定义排序"
	      end
	      field :submenus do
	      	label "子菜单"
	      end
	  	end
	  	weight 3
	 end
end
