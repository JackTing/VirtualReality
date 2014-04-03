class Layer < ActiveRecord::Base
	has_many :layer_unity3ds
    has_many :unity3ds, :through => :layer_unity3ds
end
