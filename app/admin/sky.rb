#encoding:utf-8
ActiveAdmin.register Sky do

  menu  :priority =>7,:label =>"天空管理",:parent => "材质管理"
  permit_params :name, :image,:source
  
  #列表
  index :title => '天空分类列表'  do |sky|
   selectable_column
   column "所列图" do |sky|
      image_tag sky.image_url(:thumb)
   end
   column "名称",:name
   actions
  end


  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "贴图信息" do
      f.input :name,:label=>"名称"
      f.input :image,:label => '上传缩略图',as: :file
      f.input :source,:label => '上传背景天空文件',as: :file
      f.input :sky_categories,:label=>"背景分类", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: SkyCategory.all.map{|u| ["#{u.name}", u.id]}
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
      @sky = Sky.new(permitted_params[:sky])
      add_sky_category(@sky)
      create!
    end

    def update
      add_sky_category(resource)
      update!
    end

    private
    def add_sky_category(resource)
      resource.sky_categories = []
      params[:sky][:sky_category_ids].each { |r| resource.sky_categories.push(SkyCategory.find(r)) unless r.blank? }
    end
  end
end