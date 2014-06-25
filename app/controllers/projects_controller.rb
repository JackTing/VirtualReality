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
  def layers
    @project=Project.find_by_number(params[:number])
    if @project!=nil
      @layers=@project.layers
    else
      render :text=> 'error'
    end
  end
  def unity3d_names
    @project=Project.find_by_number(params[:number])
    if @project!=nil
      @unity3ds=@project.unity3ds
    else
      render :text=> 'error'
    end
  end
  def get_sitmenus
     @project=Project.find_by_number(current_user.projects[0])
    if @project!=nil
      @sitemenus=@project.sitemenus
    else
      render :text=> 'error'
    end
  end
end
