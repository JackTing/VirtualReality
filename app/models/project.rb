class Project < ActiveRecord::Base
	has_many :project_unity3ds
    has_many :unity3ds, :through => :project_unity3ds
    has_many :user_projects
    has_many :users, :through => :user_projects
    mount_uploader :source,ProjectUploader
    resourcify

end
