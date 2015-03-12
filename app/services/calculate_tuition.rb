class CalculateTuition

  def initialize(camp_app)
    @camp_app = camp_app
    @user = camp_app.user
    @max_res_tuition = 1095
    @max_com_tuition = 880
  end

  def total_owed
    if @camp_app.camper_type == "Resident"
      event_cost = 0
      @camp_app.events.each do |event|
        event_cost += event.price_resident
      end
      if event_cost > @max_res_tuition
        return @max_res_tuition
      else
        return event_cost
      end
    elsif @camp_app.camper_type == "Commuter"
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
  end


  private


end