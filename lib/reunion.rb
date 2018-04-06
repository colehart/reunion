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

  def overall_total_paid
    @activities.map do |activity|
      activity.total_paid
    end.reduce(:+).round(2)
  end

  def overall_books_balanced?
    total cost == overall_total_paid
  end
end
