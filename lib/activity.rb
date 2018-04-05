class Activity
  attr_reader :name,
              :price,
              :participants

  def initialize(activity_name, price = 0.00)
    @name = activity_name
    @price = price.round(2)
    @participants = []
  end

  def add_participants(participant)
    @participants << participant
  end

  def total_paid
    @participants.map do |participant|
      participant[:amt_paid]
    end.reduce(:+).round(2)
  end

  def fair_share
    (@price / @participants.count).round(2)
  end

  def what_do_you_owe(participant)
    (fair_share - participant[:amt_paid]).round(2)
  end

end
