class CalculateTuition
  def initialize(camp_app)
    @camp_app = camp_app
    # TODO: Make these editable/settable at the Camp level.
    @max_res_tuition = 1995
    @max_com_tuition = 1550
    @app_fee = 200
    @breakfast_fee = 150
  end

  def financial_aid
    finaid = @camp_app.payments.where(pmt_type: ['Financial Aid', 'Scholarship']).pluck(:amount)
    finaid.reduce(0) { |sum, val| sum + val }
  end

  def max_scholarship_limit_allowed(new_scholarship)
    scholarship_amt = @camp_app.payments.where(pmt_type: ['Scholarship']).pluck(:amount)
    scholarship_total = (scholarship_amt.reduce(0) { |sum, val| sum + val } + new_scholarship)
    if @camp_app.camper_type == 'Resident'
      return true if scholarship_total <= (@max_res_tuition * 0.6)

      false

    elsif @camp_app.camper_type == 'Commuter'
      return true if scholarship_total <= (@max_com_tuition * 0.6)

      false

    else
      false
    end
  end

  def total_paid
    paid = @camp_app.payments.where.not(pmt_type: ['Financial Aid', 'Scholarship']).pluck(:amount)
    paid << @app_fee if @camp_app.app_fee
    paid.reduce(0) { |sum, val| sum + val }
  end

  def base_tuition
    if @camp_app.camper_type == 'Resident'
      res_base_cost
    elsif @camp_app.camper_type == 'Commuter'
      com_base_cost
    end
  end

  def total_owed
    if @camp_app.camper_type == 'Resident'
      res_base_cost
    elsif @camp_app.camper_type == 'Commuter'
      com_base_cost
    end
  end

  def current_balance
    starting_balance = subtract_app_fee(total_owed)
    subtract_payments(starting_balance)
  end

  private

  def res_base_cost
    eventfees = @camp_app.events.pluck(:price_resident)
    event_cost = eventfees.reduce(0) { |sum, value| sum + value }
    return @max_res_tuition + fees_owed if event_cost > @max_res_tuition

    event_cost + fees_owed
  end

  def com_base_cost
    eventfees = @camp_app.events.pluck(:price_commuter)
    event_cost = eventfees.reduce(0) { |sum, value| sum + value }
    return @max_com_tuition + fees_owed if event_cost > @max_com_tuition

    event_cost + fees_owed
  end

  def fees_owed
    fees = 0
    fees += @breakfast_fee if @camp_app.breakfast
    fees
  end

  def subtract_app_fee(total)
    return total ? total - @app_fee : 0 if @camp_app.app_fee

    total
  end

  def subtract_payments(balance)
    payments = @camp_app.payments.pluck(:amount)
    total_pmt = payments.reduce(0.0) { |sum, value| sum + value }
    balance && balance - total_pmt >= 0 ? balance - total_pmt : 0
  end
end
