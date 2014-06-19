class Sitemenu < ActiveRecord::Base
	#:dependent => :destroy当主表数据删除时，关联数据表也一起删除
	has_many :submenus,:dependent => :destroy
	resourcify
	rails_admin do
	    navigation_label "菜单管理"
	  	label_plural "主菜单"
	    list do
	      field :name do
	        label "菜单名称"
	      end
	      field :action do
	      	label "动作"
	      end
	      field :custom_sort do
	      	label "自定义排序"
	      end
	  	end
	  	edit do
	      field :name do
	        label "菜单名称"
	      end
	      field :action do
	      	label "动作"
	      end
	      field :custom_sort do
	      	label "自定义排序"
	      end
	  	end
	  	weight 3
	 end
end
