#encoding:utf-8
ActiveAdmin.register Role do
  permit_params :name, :resource_type,:resource_id,:user_role_id
  #
  config.comments = false
  #menu
  menu  :priority =>3,:label =>"角色管理",:parent => "用户管理"
  #list
  index :title => '角色列表'  do
    selectable_column
    column "角色",:name
    default_actions
  end
  #filter
  filter :name,:label=>"名称"
  #edit form
  form do |f|
    f.inputs "角色信息" do
      f.input :name,:label=>"角色"
    end
    f.actions
  end
  #
  controller do
    def show
      @page_title="显示"
      show!
    end
    def new
      @page_title="新建"
      new!
    end
    def edit
      @page_title = "编辑"
      edit!
    end
  end
end
