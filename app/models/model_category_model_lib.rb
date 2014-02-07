class ModelCategoryModelLib < ActiveRecord::Base
	belongs_to :model_category
    belongs_to :model_lib
end
