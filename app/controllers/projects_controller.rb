class ProjectsController < ApplicationController
  def unity3ds
    @project=Project.find_by_number(params[:number])
    if @project!=nil
      @unity3ds=@project.unity3ds
      respond_to do |format|
        format.json { render json: @unity3ds }
      end
   else
       render :text=> 'error'
   end
  end
end
