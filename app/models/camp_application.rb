class CampApplication < ActiveRecord::Base

  before_create :build_uuid
  after_create :send_coach_email

  has_and_belongs_to_many :events
  has_many :debate_records, dependent: :destroy
  has_many :check_out_permissions, dependent: :destroy
  belongs_to :user, :foreign_key => 'user_id'
  belongs_to :camp, :foreign_key => 'camp_id'

  accepts_nested_attributes_for :debate_records, allow_destroy: true
  accepts_nested_attributes_for :check_out_permissions, allow_destroy: true

  validate :conditional_debate_presence 

  def has_competed?
    has_competed == true
  end

  private

    def conditional_debate_presence
      return unless has_competed
      return if (debate_records.length > 0) && has_competed?
      errors.add :base, 'Debate Record Required.'
    end

    def build_uuid
      self.uuid = SecureRandom.uuid
    end

    def send_coach_email
      user = self.user
      if user.coach_email.present?
        RegistrationMailer.coach_email(user,camp,self).deliver_later
      end
    end
end
