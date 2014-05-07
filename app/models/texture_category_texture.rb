class TextureCategoryTexture < ActiveRecord::Base
	belongs_to :texture_category
    belongs_to :texture
end
