class Activity
  attr_reader :name,
              :participants

  def initialize(activity_name)
    @name = activity_name
    @participants = []
  end

  def add_participants(participant)
    @participants << participant
  end

end
