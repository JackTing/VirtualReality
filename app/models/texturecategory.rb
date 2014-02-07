class Texturecategory < ActiveRecord::Base
	#
	has_many :textures,:dependent => :destroy
	accepts_nested_attributes_for :textures, :allow_destroy => true
	

end
