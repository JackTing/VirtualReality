class VirtualController < ApplicationController
	layout :user_layout
	before_filter:authenticate_user!
	def show
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
