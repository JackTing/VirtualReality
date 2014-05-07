#encoding:utf-8
ActiveAdmin.register SkyCategory do
  #
  config.comments = false
  #
  permit_params :name
  #menu
  menu  :priority =>6,:label =>"背景天空分类管理",:parent => "材质管理"

  index :title=>"天空分类列表" do
    selectable_column
    column "名称",:name
    default_actions
  end

  filter :name,:label=>"分类名称"

  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "背景分类信息" do
      f.input :name,:label=>"名称"
      f.input :skies,:label=>"关联背景天空", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: Sky.all.map{|u| ["#{u.name}", u.id]}
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
      @sky_category = SkyCategory.new(permitted_params[:sky_category])
      add_sky(@sky_category)
      create!
    end

    def update
      add_sky(resource)
      update!
    end

    private
    def add_sky(resource)
      resource.skies = []
      params[:sky_category][:sky_ids].each { |r| resource.skies.push(Sky.find(r)) unless r.blank? }
    end

  end

end