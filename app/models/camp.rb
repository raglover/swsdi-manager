class Camp < ActiveRecord::Base

  has_many :events, dependent: :destroy
  has_many :camp_sessions, dependent: :destroy
  has_many :camp_applications, dependent: :destroy

  accepts_nested_attributes_for :camp_sessions, allow_destroy: true
  accepts_nested_attributes_for :events, allow_destroy: true

  validate :start_date_in_future, :end_date_after_or_equal_start_date, :application_starts_before_camp, :application_closes_after_open

  validates :name, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :discount_deadline, presence: :true

  scope :active, -> {where(active: true)} 
  scope :registration_open, -> {active.where( "DATE(app_start_date) <= ? AND DATE(app_end_date) >= ?", Time.zone.now, Time.zone.now )}
  scope :registration_closed, -> {active.where( "DATE(app_end_date) <= ?", Time.zone.now)}

  def session_application_counts
    count = {}
    sessions = self.camp_sessions
    sessions.each() do |session|
      events = session.events
      appcnt = 0
      events.each() do |event|
        name = session.name
        appcnt += event.camp_applications.count
        tmpcnt = Hash.new
        tmpcnt[name] = appcnt
        count.merge!(tmpcnt)
      end
    end
    return count
  end


  private
    def start_date_in_future
      unless self.start_date >= Time.zone.now
        errors.add(:start_date, "Must be a future date.")
      end
    end

    def end_date_after_or_equal_start_date
      unless self.end_date >= self.start_date
        errors.add(:end_date, "Must be on or after start date.")
      end
    end

    def application_starts_before_camp
      unless self.app_start_date < self.start_date && self.app_end_date <= self.start_date
        errors.add(:app_start_date, "Application process must be prior to camp.")
      end 
    end

    def application_closes_after_open
      unless self.app_end_date > self.app_start_date
        errors.add(:app_end_date, "Must be later than App Start Date.")
      end
    end
end
