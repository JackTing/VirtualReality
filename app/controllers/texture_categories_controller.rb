class TextureCategoriesController < ApplicationController
	def index
	  @texture_categories = TextureCategory.all
	  respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @texture_categories }
	  end
	end
	def show
	  begin
		 @texture_category = TextureCategory.find(params[:id])
		 @texture_categories = TextureCategory.all
	  rescue ActiveRecord::RecordNotFound
		 logger.error "Can't find texturecategory" #{params[:id]}
	  else
	     respond_to do |format|
	       format.js 
           format.html # show.html.erb
           format.json { render json: @texture_category }
         end
	  end
 	end

end
