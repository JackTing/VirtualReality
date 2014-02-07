#encoding:utf-8
ActiveAdmin.register Sitemenu do
  permit_params :name,:custom_sort,:action
  #
  config.comments = false
  #
  sidebar "子菜单信息", only: [:show, :edit] do
    ul do
      li link_to("查看子菜单", admin_sitemenu_submenus_path(sitemenu))
    end
  end
  menu  :priority =>5,:label =>"主菜单管理",:parent => "菜单管理"
  index :title => '主菜单列表' do
    selectable_column
    column "菜单名称",:name
    column "排序",:custom_sort
    column "菜单命令",:action
    default_actions
  end

  filter :name,:label=>"菜单名称"

  form do |f|
    f.inputs "菜单信息" do
      f.input :name,:label=>"菜单名称"
      f.input :custom_sort,:label=>"排序"
      f.input :action,:label=>"菜单命令"
    end
    f.actions
  end
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
      @page_title="编辑"
      edit!
    end
  end

end
