class Project < ActiveRecord::Base
	has_many :project_unity3ds
    has_many :unity3ds, :through => :project_unity3ds
	resourcify
end
