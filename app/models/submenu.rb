class Submenu < ActiveRecord::Base
	belongs_to :sitemenu
	rails_admin do
	  	label_plural "子菜单"
	  	parent Sitemenu
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
	      field :sitemenu do
	      	label "所属主菜单"
	      end
	  	end
	  	weight 3
	 end
end
