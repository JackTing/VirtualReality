class VirtualController < ApplicationController
	layout :user_layout
	before_filter:authenticate_user!
	def show
		@texture_category = current_texture_category
		@model_category=current_model_category
		@sky_category=current_sky_category

		unless current_user.projects.empty?
			@current_project=current_user.projects[0].source.url
			render :action=>'show'
		else
			render :action=>'error'
		end
	end
    private
	def user_layout 
	    if current_user.has_role? :designer
	      "design"  
	    else
	      "application"
	    end  
	end  
end
