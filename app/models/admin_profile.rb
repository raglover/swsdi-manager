class AdminProfile < ActiveRecord::Base

	belongs_to :admin
	has_and_belongs_to_many :events

	mount_uploader :image, AvatarUploader

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :bio, presence: true
	validates :address_line1, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip, presence: true
	validates :phone, presence: true

 		def full_name
    	"#{self.pref_first_name} #{self.last_name}"
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

end
