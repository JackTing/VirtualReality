#encoding:utf-8
ActiveAdmin.register Layer do
	menu  :label =>"图层管理"
  #
  permit_params :name
  index :title => '图层列表' do  
    selectable_column
    column "名称",:name                   
    actions    
  end        
  #filter
  filter :name ,:label=>"图层名称"
  #edit form
  form do |f|
    f.inputs "编辑计划信息" do
      f.input :name,:label=>"图层名称"
      f.input :unity3ds,:label=>"关联模型", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: Unity3d.all.map{|u| ["#{u.category}--#{u.name}", u.id]}
    end
    f.actions
  end
  #show
  show :title =>:name do
     attributes_table do
        row :objectname do |r|
          r.unity3ds.map { |unity3d| unity3d.objectname }.join(", ")
        end
      end
      active_admin_comments
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
      @layer = Layer.new(permitted_params[:layer])
      add_unity3d(@layer)
      create!
    end

    def update
      add_unity3d(resource)
      update!
    end

    private
    def add_unity3d(resource)
      resource.unity3ds = []
      params[:layer][:unity3d_ids].each { |r| resource.unity3ds.push(Unity3d.find(r)) unless r.blank? }
    end
  end
end
