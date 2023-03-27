class FinancialReport

  attr_reader :apps
  
  def initialize(camp)
    @camp = camp
    @apps = @camp.camp_applications
    @app_fee = 0
  end

  def total_owed
    tuitions = []
    @apps.each do |app|
      tuition = CalculateTuition.new(app)
      tuitions << tuition.total_owed
    end
    tuitions.compact!
    total = tuitions.reduce(0){|sum, val| sum + val}
    total
  end

  def total_paid
    payments = []
    @apps.each do |app|
      if app.app_fee
        payments << @app_fee
      end
      pmts = app.payments
      pmts.each do |pmt|
        payments << pmt.amount
      end
    end
    total = payments.reduce(0){|sum, val| sum + val}
    total
  end

  def total_financial_aid
    payments = []
    @apps.each do |app|
      pmts = app.payments.where(pmt_type: ["Financial Aid", "Scholarship"])
      pmts.each do |pmt|
        payments << pmt.amount
      end
    end
    total = payments.reduce(0){|sum, val| sum + val}
    total
  end

  def total_money_received
    total_paid - total_financial_aid
  end

end