
#encoding:utf-8
ActiveAdmin.register ModelLib do
  menu :priority =>9, :label =>"设计模型管理",:parent => "模型管理"
  #
  permit_params :name,:image,:source

  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "模型信息" do
      f.input :name,:label=>"名称"
      f.input :image,:label => '上传模型缩略图',as: :file
      f.input :source,:label => '上传文件',as: :file
      f.input :model_categories,:label=>"模型分类", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: ModelCategory.all.map{|u| ["#{u.name}", u.id]}
    end
    f.actions
  end
  controller do
    def new
      @page_title="新建"
      new!
    end
    def edit
      @page_title="编辑"
      edit!
    end
    def create
      @model_lib = ModelLib.new(permitted_params[:model_lib])
      add_model_category(@model_lib)
      create!
    end

    def update
      add_model_category(resource)
      update!
    end

    private
    def add_model_category(resource)
      resource.model_categories = []
      params[:model_lib][:model_category_ids].each { |r| resource.model_categories.push(ModelCategory.find(r)) unless r.blank? }
    end
  end
end
