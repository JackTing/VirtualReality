class Plan < ActiveRecord::Base
	has_many :plan_unity3ds
    has_many :unity3ds, :through => :plan_unity3ds
	resourcify
end
