#encoding:utf-8
ActiveAdmin.register Info do
   belongs_to :unity3d
   #
   permit_params :key, :value, :unity3d_id
   #list
   index :title => '属性列表'  do
    selectable_column
    column "属性名称",:key
    column "属性值",:value
    default_actions
   end
   #
   filter :key,:label=>"属性名称"
   #edit or new  form
   form do |f|
    f.inputs  do
      f.input :key,:label=>"属性名称"
      f.input :value,:label=>"属性值"
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
   end
end
