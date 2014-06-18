class Unity3d < ActiveRecord::Base
 
 has_many :plan_unity3ds
 has_many :plans, :through => :plan_unity3ds

 has_many :layer_unity3ds
 has_many :layers, :through => :layer_unity3ds

 has_many :project_unity3ds
 has_many :projects,:through=> :project_unity3ds

 has_many :infos,:dependent => :destroy
 mount_uploader :source,Unity3dUploader
 resourcify
end
