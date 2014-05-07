class SkyCategoriesController < ApplicationController
	def index
	  @sky_categories = SkyCategory.all
	  respond_to do |format|
	    format.html # index.html.erb
	    format.json { render json: @sky_categories }
	  end
	end
	def show
	  begin
		 @sky_category = SkyCategory.find(params[:id])
		 @sky_categories =SkyCategory.all
	  rescue ActiveRecord::RecordNotFound
		 logger.error "Can't find skycategory" #{params[:id]}
	  else
	     respond_to do |format|
	       format.js 
           format.html # show.html.erb
           format.json { render json: @sky_category }
         end
	  end
 	end

end
