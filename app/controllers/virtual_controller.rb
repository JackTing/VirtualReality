class VirtualController < ApplicationController
	before_filter:authenticate_user!
	def show
		render :action=>'show'
	end
end
