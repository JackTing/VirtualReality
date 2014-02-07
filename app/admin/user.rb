#encoding:utf-8
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation
  #
  config.comments = false
  menu  :priority =>2,:label =>"用户管理",:parent => "用户管理"
  index :title => '用户列表' do
    selectable_column
    column "账户",:email
    column "当前登陆时间",:current_sign_in_at
    column "上次登陆时间",:last_sign_in_at
    column "登陆次数",:sign_in_count
    default_actions
  end

  filter :email,:label=>"账户"

  form do |f|
    f.inputs "用户信息" do
      f.input :email,:label=>"账户"
      f.input :password,:label=>"密码"
      f.input :roles,:label=>"角色", as: :check_boxes, collection: Role.all
      f.input :password_confirmation,:label=>"验证密码"
    end
    f.actions
  end

  show :title => '显示' do |event|
    attributes_table do
      row :email,:label=>"账户"
      row :password,:label=>"密码"
      row :current_sign_in_at,:label=>"当前登陆时间"
      row :last_sign_in_at,:label=>"上次登陆时间"
      row :sign_in_count,:label=>"登陆次数"
      row :roles do |r|
        r.roles.map { |role| role.name }.join(", ")
      end
    end
  end

   controller do
    def edit
      @page_title = "编辑"
      edit!
    end
    def create
      @user = User.new(permitted_params[:user])
      add_roles(@user)
      create!
    end

    def update
      add_roles(resource)
      update!
    end

    private
    def add_roles(resource)
      resource.roles = []
      params[:user][:role_ids].each { |r| resource.roles.push(Role.find(r)) unless r.blank? }
    end
   end
end
