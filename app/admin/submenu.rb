#encoding:utf-8
ActiveAdmin.register Submenu do
  belongs_to :sitemenu
  # 
  permit_params :name, :custom_sort, :action,:sitemenu_id
  #
  index  :title => '子菜单列表' do
    selectable_column
    column "菜单名称",:name
    column "排序",:custom_sort
    column "菜单命令",:action
    default_actions
  end
  
  form do |f|
    f.inputs "菜单信息" do
      f.input :sitemenu,:label=>"主菜单", as: :select, collection: Sitemenu.all
      f.input :name,:label=>"菜单名称"
      f.input :custom_sort,:label=>"排序"
      f.input :action,:label=>"菜单命令"
    end
    f.actions
  end
  filter :name,:label=>"菜单名称"
  controller do
   def show
      @page_title="显示"
      show!
    end
    def new
      @page_title="新建"
      new!
    end
    def edit
      @page_title="编辑"
      edit!
    end
  end
end