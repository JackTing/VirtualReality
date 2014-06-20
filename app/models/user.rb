class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects,:dependent => :destroy
  has_many :projects, :through => :user_projects

  rails_admin do
    navigation_label "用户管理"
  	label_plural '用户管理'

    list do
      field :email do
        label "账户"
      end
      field :current_sign_in_at do 
        label "当前登陆时间"
      end
      field :last_sign_in_at do 
        label "上次登陆时间"
      end
      field :sign_in_count do 
        label "登陆次数"
      end
    end
    edit do
      field :email do
        label "账户"
      end
      field :password do 
        label "密码"
      end
      field :password_confirmation do 
        label "验证密码"
      end
      field :roles do 
        label "角色"
      end
      field :projects do 
        label "隶属项目"
      end
    end
    weight 5
  end
end
