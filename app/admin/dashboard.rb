#encoding:utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "最新用户" do
          table_for User.order('id desc').limit(5).each do |user|
            column("邮箱",:email) {|user| link_to(user.email, admin_user_path(user)) }
            column("上次登陆时间",:last_sign_in_at)
            column("登陆次数",:sign_in_count)
          end
           strong{link_to "查看更多用户",admin_users_path}
        end
       
      end
      column do
        panel "最新计划" do
          table_for Plan.order('id desc').limit(5).each do |plan|
            column("工程名称",:wbsname) {|plan| link_to(plan.wbsname, admin_plan_path(plan)) }
             
            column("完成百分比",:wbspctcomp)
          end
          strong{link_to "查看更多计划",admin_plans_path}
        end
      end
      column do
        panel "最新上传进度模型" do
          table_for Unity3d.order('id desc').limit(5).each do |unity3d|
            column("工程名称",:name) {|unity3d| link_to(unity3d.name, admin_unity3d_path(unity3d)) }
            column("三维物体名称",:objectname)
            column("分类",:category)
          end
           strong{link_to "查看更多进度模型",admin_unity3ds_path}
        end
      end
    end # columns
    #columns do
      #column do
         # panel "最新上传材质贴图" do
            #table_for Texture.order('id desc').limit(5).each do |texture|
            # column("名称",:name) 
              # column "贴图" do |texture|
              #      image_tag texture.image_url(:thumb)
             #  end
           # end
         # end
      # end
    # end


  end # content
end
