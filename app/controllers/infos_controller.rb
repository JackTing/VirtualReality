class InfosController < ApplicationController
 	def new
  	 	params.permit!
		@unity3d=Unity3d.find(params[:unity3d_id])
		@info=@unity3d.infos.new(params[:info])
	    respond_to do |format|
	      #format.html # new.html.erb
	      #format.json { render json: @site_item }
	      format.js # new.js.erb
	    end
  	end
	def create
		params.permit!
		@unity3d=Unity3d.find(params[:unity3d_id])
		@info=@unity3d.infos.create(params[:info])
		redirect_to unity3d_path(@unity3d)
	end
	def destroy
		params.permit!
		@unity3d=Unity3d.find(params[:unity3d_id])
		@info=@unity3d.infos.find(params[:id])
		@info.destroy
		redirect_to unity3d_path(@unity3d)
	end
end
