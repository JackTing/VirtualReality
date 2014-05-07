class SkyCategory < ActiveRecord::Base
	has_many :sky_category_skies,:dependent => :destroy
    has_many :skies, :through => :sky_category_skies
end
