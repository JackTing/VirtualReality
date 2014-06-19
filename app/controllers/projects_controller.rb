class ProjectsController < ApplicationController
  def unity3ds
    @project=Project.find_by_number(params[:number])
    if @project!=nil
      @unity3ds=@project.unity3ds
   else
       render :text=> 'error'
   end
  end
  def plans
  	@project=Project.find_by_number(params[:number])
    if @project!=nil
      @plans=@project.plans
   else
       render :text=> 'error'
   end
  	
  end
end
