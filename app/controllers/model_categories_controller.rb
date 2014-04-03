class ModelCategoriesController < ApplicationController

	def find_by_page
		@model_categories=ModelCategory.order(:name).page params[:page]
	end

end
