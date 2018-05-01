class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :admin_profile, dependent: :destroy

  scope :board, -> {where("role = 'board' OR role = 'super'")}
  scope :counselors, -> {where("role = 'counselor' OR role = 'slc'")}

  def full_name
    "#{self.admin_profile.first_name.capitalize} #{self.admin_profile.last_name.capitalize}"
  end

  def super_admin?
    role == 'super'
  end

  def board_member?
    role == 'board'
  end

  def slc?
    role == 'slc'
  end

  def counselor?
    role == 'counselor'
  end
  
end
