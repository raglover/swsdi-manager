class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable 

  has_many :camp_applications, dependent: :destroy

  mount_uploader :image, AvatarUploader

  # default_scope { order(:last_name, :first_name) }

  scope :with_apps, -> { joins(:camp_applications) }

  validates :gender, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :parent_email, presence: true
  validates :school, presence: true


  def full_name
    "#{self.pref_first_name.capitalize} #{self.last_name.capitalize}"
  end

  def pref_first_name
    if self.nickname.blank?
      "#{self.first_name}"
    else
      "#{self.nickname}"
    end
  end

  def age
    if self.birthday.present?
      dob = self.birthday
      now = Time.now.utc.to_date
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    else
      "No Birthday Entered"
    end
  end

  def needs_reminding?
    if !self.reminder_flag && self.camp_applications.count == 0
      return true
    else
      return false
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def school=(val)
    if val
      write_attribute :school, val.downcase
    end
  end

end
