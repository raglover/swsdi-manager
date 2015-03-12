class CalculateTuition

  def initialize(camp_app)
    @camp_app = camp_app
    @user = camp_app.user
    @max_res_tuition = 1095
    @max_com_tuition = 880
    @airport_fee = 20
    @app_fee = 50
    @team_scholarship_disc = 100
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
      if @camp_app.needs_pickup || @camp_app.needs_dropoff
        fees += @airport_fee
      end
      return fees
    end

    def subtract_app_fee(total)
      if @camp_app.app_fee
        return total - @app_fee
      else
        return total
      end
    end

    def subtract_payments(balance)
      payments = @camp_app.payments.pluck(:amount)
      total_pmt = payments.reduce(0.0){|sum, value| sum + value}
      balance = balance - total_pmt
      return balance
    end

end