
#encoding:utf-8
ActiveAdmin.register Plan do
  menu :priority =>3, :label =>"计划维护",:parent => "计划管理"
  #
  permit_params :wbsno,:wbsname,:quantitiesplan,:quantitiesfact,:wbspctcomp
  #sidebar
  #sidebar "帮助",:only => :index do
   # "如果你对网站后台管理有问题,请联系powermedia@qq.com"
  #end
  #list
  index :title => '计划列表' do  
    selectable_column
    column "序号",:wbsno 
    column "工程名称",:wbsname                      
    column "计划工作量",:quantitiesplan
    column "完成工作量",:quantitiesfact
    column "完成百分比",:wbspctcomp
    default_actions    
  end        
  #filter
  filter :wbsno ,:label=>"序号"
  filter :wbspctcomp ,:label=>"完成百分比"
  #edit form
  form do |f|
    f.inputs "编辑计划信息" do
      f.input :wbsno,:label=>"序号"
      f.input :wbsname,:label=>"工程名称"
      f.input :quantitiesplan,:label=>"计划工作量"
      f.input :quantitiesfact,:label=>"完成工作量"
      f.input :wbspctcomp,:label=>"完成百分比"
      #f.input :unity3ds,:label=>"关联模型", as: :radio, collection: Unity3d.all
      f.input :unity3ds,:label=>"关联模型", as: :select,:input_html => { :size =>15,:style=>'width:250px',:multiple => false},  collection: Unity3d.all.map{|u| ["#{u.category}--#{u.name}", u.id]}
    end
    #f.inputs "添加内容" do
    #  f.input :content,:label=>"文章内容"
    #end
    #f.buttons 
    f.actions
  end
  #show
  show :title =>:wbsname do
     attributes_table do
        row :wbsname
        row :objectname do |r|
          r.unity3ds.map { |unity3d| unity3d.objectname }.join(", ")
        end
        row :quantitiesplan
        row :quantitiesfact
        row :wbspctcomp
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
      @plan = Plan.new(permitted_params[:plan])
      add_unity3d(@plan)
      create!
    end

    def update
      add_unity3d(resource)
      update!
    end

    private
    def add_unity3d(resource)
      resource.unity3ds = []
      params[:plan][:unity3d_ids].each { |r| resource.unity3ds.push(Unity3d.find(r)) unless r.blank? }
    end
  end
end
