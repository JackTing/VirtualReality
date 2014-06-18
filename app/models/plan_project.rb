class PlanProject < ActiveRecord::Base
	belongs_to :project
    belongs_to :plan
end
