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
      @texture_categories[0]
    rescue ActiveRecord::RecordNotFound
      texture_category = TextureCategory.new
      texture_category.name="石材"
      texture_category.save
      texture_category
  end
  def current_model_category
    @model_categories=ModelCategory.all
    @model_categories[0]
    rescue ActiveRecord::RecordNotFound
      model_category = ModelCategory.new
      model_category.name="办公楼"
      model_category.save
      model_category
  end

end
