class VirtualController < ApplicationController
	layout :user_layout
	before_filter:authenticate_user!
	def show
		@texture_category = current_texture_category
		@model_category=current_model_category
		render :action=>'show'
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
