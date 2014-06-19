class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify

  rails_admin do
  	label_plural '角色管理'
    parent User
  	 list do
  	 	field :name do
  	 		label "角色"
  	 	end
  	 end
  	 edit do
  	 	field :name do
  	 		label "角色"
  	 	end
  	 end
  end
end
