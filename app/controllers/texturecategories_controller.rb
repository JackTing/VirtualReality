class TexturecategoriesController < ApplicationController

	def find_by_page
		@texturecategories=Texturecategory.order(:name).page params[:page]
	end
end
