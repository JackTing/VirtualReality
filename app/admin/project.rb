ActiveAdmin.register Project do
  menu :priority =>3, :label =>"项目管理"
  #
  permit_params :name,:number,:info
  index :title => '项目列表' do  
    selectable_column
    column "名称",:name
    column "编号",:number
    column "简介",:info
    default_actions    
  end        
  #filter
  filter :name ,:label=>"名称"
  #edit form
  form do |f|
    f.inputs "编辑项目信息" do
      f.input :name,:label=>"名称"
      f.input :number,:label=>"编号"
      f.input :info,:label=>"简介"
      f.input :unity3ds,:label=>"关联模型", as: :select,:input_html => { :size =>15,:style=>'width:250px'},  collection: Unity3d.all.map{|u| ["#{u.category}--#{u.name}", u.id]}
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
      @project = Project.new(permitted_params[:project])
      add_unity3d(@project)
      create!
    end

    def update
      add_unity3d(resource)
      update!
    end

    private
    def add_unity3d(resource)
      resource.unity3ds = []
      params[:project][:unity3d_ids].each { |r| resource.unity3ds.push(Unity3d.find(r)) unless r.blank? }
    end
 end

end