class VirtualController < ApplicationController
	layout :user_layout
	before_filter:authenticate_user!
	def show	
		@texture_category = current_texture_category
		@model_category=current_model_category
		@sky_category=current_sky_category

		if current_user.project
			@current_project=current_user.project.source.url
			render :action=>'show'
		else
			render :text=>'error'
		end
	end
    private
	def user_layout 
		if current_user
		    if current_user.has_role? :designer
		      "design"  
		    else
		      "application"
		    end  
		 else
		 	"devise"

		 end
	end  
end
