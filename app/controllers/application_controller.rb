class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
  def after_sign_in_path_for(resource)  
       if resource.is_a?(User)  
         if User.count == 1  
           resource.add_role 'admin'  
         end  
         resource  
       end  
       root_path  
  end  
  def authenticate_active_admin_user!
     authenticate_user!
     unless current_user.has_role? :admin
       flash[:alert]="You are not authorized to access this resource!"
       redirect_to root_path
     end
  end
  private
  def current_texture_category
      @texture_categories=TextureCategory.all
      if @texture_categories.length>0
         @texture_categories[0]
      else
         texture_category = TextureCategory.new
         texture_category.name="石材"
         texture_category.save
         texture_category
      end
    rescue ActiveRecord::RecordNotFound
      texture_category = TextureCategory.new
      texture_category.name="石材"
      texture_category.save
      texture_category
  end
  def current_model_category
    @model_categories=ModelCategory.all
    if @model_categories.length>0
      @model_categories[0]
    else
      model_category = ModelCategory.new
      model_category.name="办公楼"
      model_category.save
      model_category
    end
    rescue ActiveRecord::RecordNotFound
      model_category = ModelCategory.new
      model_category.name="办公楼"
      model_category.save
      model_category
  end
  def current_sky_category
    @sky_categories=SkyCategory.all
    if @sky_categories.length>0
      @sky_categories[0]
    else
      sky_category = SkyCategory.new
      sky_category.name="白天"
      sky_category.save
      sky_category
    end
    rescue ActiveRecord::RecordNotFound
      sky_category = SkyCategory.new
      sky_category.name="白天"
      sky_category.save
      sky_category
  end

end
