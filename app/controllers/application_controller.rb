class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 def uploadfile(file)
    if !file.original_filename.empty?
      filename = file.original_filename
      #设置目录路径，如果目录不存在，生成新目录
      FileUtils.mkdir("#{Rails.root}/public/Data/Prefabs/QinZhouGang/") unless File.exist?("#{Rails.root}/public/Data/Prefabs/QinZhouGang/")
      #写入文件      
      ##wb 表示通过二进制方式写，可以保证文件不损坏
      File.open("#{Rails.root}/public/Data/Prefabs/QinZhouGang/#{filename}", "wb") do |f|
        f.write(file.read)
      end
      return "Prefabs/QinZhouGang/#{filename}"
    end
  end   
  
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


end
