#encoding:utf-8
ActiveAdmin.register Texture do
  belongs_to :texture_category
  permit_params :name, :image, :texture_category_id
  
  index  do |texture|
   selectable_column
   column "贴图" do |texture|
     image_tag texture.image_url(:thumb)
   end
   column "名称",:name
   default_actions
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
  end
end