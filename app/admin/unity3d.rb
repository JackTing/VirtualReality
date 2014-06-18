#encoding:utf-8
ActiveAdmin.register Unity3d do
   permit_params :name, :category, :objectname,:source,:use,:option,:plan,:num
	 sidebar "三维物体信息", only: [:show, :edit] do
      ul do
        li link_to("显示属性", admin_unity3d_infos_path(unity3d))
      end
   end
   #菜单名城及排序
   menu  :priority =>4,:label =>"进度模型管理",:parent => "模型管理"

   #列表
   index :title => '进度模型列表' do
    selectable_column
    column "工程名称",:name
    column "工种",:category
    column "三维物体名称(英文)",:objectname
    column "是否使用",:use
    column "其它选项信息",:option
    column "是否参与进度",:plan
    column "子物体数量",:num
    actions
  end
  #左侧过滤
  filter :projects,:label=>"隶属项目"
  #编辑修改
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "模型信息" do
      f.input :name,:label=>"工程名称"
      f.input :category,:label=>"工种"
      f.input :objectname,:label=>"三维物体名称(英文)"
      f.input :source,:label => '上传文件',as: :file
      f.input :use,:label=>"是否使用"
      f.input :option,:label=>"其它选项信息"
      f.input :plan,:label=>"是否参与进度"
      f.input :num,:label=>"子物体数量"
      f.input :projects,:label=>"所属项目", as: :select,:input_html => { :size =>15,:style=>'width:250px',:multiple => false},  collection: Project.all.map{|u| ["#{u.name}", u.id]}
    end
    f.actions
  end

  #自定义cotroller 方法
  controller do 
    def edit
      @page_title = "编辑"
      edit!
    end
    def create
      @unity3d = Unity3d.new(permitted_params[:unity3d])
      add_project(@unity3d)
      create!
    end

    def update
      add_project(resource)
      update!
    end

    private
    def add_project(resource)
      resource.projects = []
      params[:unity3d][:project_ids].each { |r| resource.projects.push(Project.find(r)) unless r.blank? }
    end
  end

end
