class ModelCategory < ActiveRecord::Base
	has_many :model_category_model_libs
    has_many :model_libs, :through => :model_category_model_libs
end
