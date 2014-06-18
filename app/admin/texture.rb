#encoding:utf-8
ActiveAdmin.register Texture do

  menu  :priority =>6,:label =>"材质贴图管理",:parent => "材质管理"
  permit_params :name, :image
  
  #列表
  index :title => '材质贴图分类列表'  do |texture|
   selectable_column
   column "贴图" do |texture|
      image_tag texture.image_url(:thumb)
   end
   column "名称",:name
   actions
  end


  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "贴图信息" do
      f.input :name,:label=>"名称"
      f.input :image,:label => '上传贴图',as: :file
      f.input :texture_categories,:label=>"贴图分类", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: TextureCategory.all.map{|u| ["#{u.name}", u.id]}
    end
    f.actions
  end
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
      @texture = Texture.new(permitted_params[:texture])
      add_texture_category(@texture)
      create!
    end

    def update
      add_texture_category(resource)
      update!
    end

    private
    def add_texture_category(resource)
      resource.texture_categories = []
      params[:texture][:texture_category_ids].each { |r| resource.texture_categories.push(TextureCategory.find(r)) unless r.blank? }
    end
  end
end