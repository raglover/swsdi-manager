class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :admin_profile

  def super_admin?
    role == 'super'
  end

  def board_member?
    role == 'board'
  end

  def counselor?
    role == 'counselor'
  end
  
end
