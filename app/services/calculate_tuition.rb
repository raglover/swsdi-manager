class CalculateTuition

  def initialize(camp_app)
    @camp_app = camp_app
    #TODO: Make these editable/settable at the Camp level.
    @max_res_tuition = 1395
    @max_com_tuition = 1030
    @app_fee = 0
  end

  def financial_aid
    finaid = @camp_app.payments.where(pmt_type: ["Financial Aid", "Scholarship"]).pluck(:amount)
    finaid.reduce(0){|sum, val| sum + val}
  end

  def total_paid
    paid = @camp_app.payments.where.not(pmt_type: ["Financial Aid", "Scholarship"]).pluck(:amount)
    if @camp_app.app_fee
      paid << @app_fee
    end
    paid.reduce(0){|sum, val| sum + val}
  end

  def base_tuition
    if @camp_app.camper_type == "Resident"
      return res_base_cost
    elsif @camp_app.camper_type == "Commuter"
      return com_base_cost
    end
  end   

  def total_owed
    if @camp_app.camper_type == "Resident"
      return (res_base_cost + fees_owed)
    elsif @camp_app.camper_type == "Commuter"
      return (com_base_cost + fees_owed)
    end
  end

  def current_balance
    starting_balance = subtract_app_fee(total_owed)
    balance = subtract_payments(starting_balance)
    return balance
  end

  private

    def res_base_cost
      eventfees = @camp_app.events.pluck(:price_resident)
      event_cost = eventfees.reduce(0){|sum, value| sum + value}
      if event_cost > @max_res_tuition
        return @max_res_tuition
      else
        return event_cost
      end
    end

    def com_base_cost
      eventfees = @camp_app.events.pluck(:price_commuter)
      event_cost = eventfees.reduce(0){|sum, value| sum + value}
      if event_cost > @max_com_tuition
        return @max_com_tuition
      else
        return event_cost
      end
    end

    def fees_owed
      fees = 0
      return fees
    end

    def subtract_app_fee(total)
      if @camp_app.app_fee
        return total ? total - @app_fee : 0
      else
        return total
      end
    end

    def subtract_payments(balance)
      payments = @camp_app.payments.pluck(:amount)
      total_pmt = payments.reduce(0.0){|sum, value| sum + value}
      balance =  balance && balance - total_pmt >= 0 ? balance - total_pmt : 0
      return balance
    end

end
