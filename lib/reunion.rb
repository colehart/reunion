class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def total_cost
    @activities.map do |activity|
      activity.price
    end.reduce(:+).round(2)
  end
end
