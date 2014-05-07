class SkyCategorySky < ActiveRecord::Base
	belongs_to :sky_category
    belongs_to :sky
end
