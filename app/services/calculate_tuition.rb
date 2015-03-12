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
      event_cost = 0
      @camp_app.events.each do |event|
        event_cost += event.price_resident
      end
      if event_cost > @max_res_tuition
        return @max_res_tuition
      else
        return event_cost
      end
    end

    def com_base_cost
      event_cost = 0
      @camp_app.events.each do |event|
        event_cost += event.price_commuter
      end
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
      payments = @camp_app.payments.all
      total_pmt = 0.0
      if !payments.blank?
        payments.each do |pmt|
          total_pmt += pmt.amount
        end
      end
      balance = balance - total_pmt
      return balance
    end

end