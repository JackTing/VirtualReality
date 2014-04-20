#encoding:utf-8
ActiveAdmin.register TextureCategory do
  #
  config.comments = false
  #
  permit_params :name
  #menu
  menu  :priority =>6,:label =>"材质分类管理",:parent => "材质管理"
  #sidebar
  sidebar "材质信息", only: [:show, :edit] do
    ul do
      li link_to("查看材质", admin_texture_category_textures_path(texture_category))
    end
  end
  #list 


  index :title=>"材质分类列表" do
    selectable_column
    column "名称",:name
    default_actions
  end

  filter :name,:label=>"分类名称"

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "分类信息" do
      f.input :name,:label=>"名称"
    end
    f.actions
  end
  #custom controller
  controller do
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