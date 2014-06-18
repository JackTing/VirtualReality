
#encoding:utf-8
ActiveAdmin.register ModelCategory do
  menu :priority =>7,:label =>"设计模型分类",:parent => "模型管理"
  #
  permit_params :name
  #列表
  index :title => '设计模型分类列表' do
    selectable_column
    column "分类名称",:name
    actions
  end
  #filter
  filter :name ,:label=>"分类名称"
  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "模型分类信息" do
      f.input :name,:label=>"名称"
      f.input :model_libs,:label=>"关联模型", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: ModelLib.all.map{|u| ["#{u.name}", u.id]}
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
      @model_category = ModelCategory.new(permitted_params[:model_category])
      add_model(@model_category)
      create!
    end

    def update
      add_model(resource)
      update!
    end

    private
    def add_model(resource)
      resource.model_libs = []
      params[:model_category][:model_lib_ids].each { |r| resource.model_libs.push(ModelLib.find(r)) unless r.blank? }
    end
  end
end
