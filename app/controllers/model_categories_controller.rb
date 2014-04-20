class ModelCategoriesController < ApplicationController
	def index
	  @model_categories = ModelCategory.all
	  respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @model_categories }
	  end
	end
    def show
	  begin
		 @model_category = ModelCategory.find(params[:id])
		 @model_category = ModelCategory.all
	  rescue ActiveRecord::RecordNotFound
		 logger.error "Can't find modelcategory" #{params[:id]}
	  else
	     respond_to do |format|
	       format.js 
           format.html # show.html.erb
           format.json { render json: @model_category }
         end
	  end
 	end

end
