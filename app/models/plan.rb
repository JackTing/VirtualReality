class Plan < ActiveRecord::Base
	has_many :plan_unity3ds
    has_many :unity3ds, :through => :plan_unity3ds

    has_many :plan_projects
    has_many :projects,:through=> :plan_projects

	resourcify
end
