class SkyCategory < ActiveRecord::Base
	has_many :sky_category_skies,:dependent => :destroy
    has_many :skies, :through => :sky_category_skies

    rails_admin do
		label_plural "背景天空分类"
		navigation_label "环境管理"
		list do
			field :name do
				label "名称"
			end
		end
		weight 2
	end
end
