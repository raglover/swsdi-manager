class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [ :facebook ]
end
