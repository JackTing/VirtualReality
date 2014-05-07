#encoding:utf-8
ActiveAdmin.register TextureCategory do
  #
  config.comments = false
  #
  permit_params :name
  #menu
  menu  :priority =>6,:label =>"材质分类管理",:parent => "材质管理"

  index :title=>"材质分类列表" do
    selectable_column
    column "名称",:name
    default_actions
  end

  filter :name,:label=>"分类名称"

  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "材质贴图分类信息" do
      f.input :name,:label=>"名称"
      f.input :textures,:label=>"关联贴图", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: Texture.all.map{|u| ["#{u.name}", u.id]}
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
    def create
      @texture_category = TextureCategory.new(permitted_params[:texture_category])
      add_texure(@texture_category)
      create!
    end

    def update
      add_texure(resource)
      update!
    end

    private
    def add_texure(resource)
      resource.textures = []
      params[:texture_category][:texture_ids].each { |r| resource.textures.push(Texture.find(r)) unless r.blank? }
    end

  end

end