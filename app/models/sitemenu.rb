class Sitemenu < ActiveRecord::Base
	#:dependent => :destroy当主表数据删除时，关联数据表也一起删除
	has_many :submenus,:dependent => :destroy
	resourcify
end
