class CampApplication < ActiveRecord::Base

  before_create :build_uuid
  after_create :send_coach_email

  has_and_belongs_to_many :events
  has_many :debate_records, dependent: :destroy
  has_many :check_out_permissions, dependent: :destroy
  belongs_to :user, :foreign_key => 'user_id'
  belongs_to :camp, :foreign_key => 'camp_id'
  has_one :coach_comment, dependent: :destroy
  has_many :payments, dependent: :destroy


  accepts_nested_attributes_for :debate_records, allow_destroy: true
  accepts_nested_attributes_for :check_out_permissions, allow_destroy: true

  validate :conditional_debate_presence 

  def has_competed?
    has_competed == true
  end

  def arrival_date
    dates = []
    self.events.each do |event|
      dates << event.camp_session.session_start
      dates << event.camp_session.session_end
    end
    dates.sort!
    dates.first
  end

  def departure_date
    dates = []
    self.events.each do |event|
      dates << event.camp_session.session_start
      dates << event.camp_session.session_end
    end
    dates.sort!
    dates.last
  end

  private

    def conditional_debate_presence
      return unless has_competed
      return if (debate_records.length > 0) && has_competed? && (check_event_types)
      return if (debate_records.length >= 0) && has_competed? && (!check_event_types)
      errors.add :base, 'Debate Record Required.'
    end

    def check_event_types
      check = true
      evs = self.events.event_names
      evs.each do |ev|
        ck = Event.debate_events.event_names.include?(ev)
        return ck if ck == check
      end
      return false
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
