require "./test/test_helper"
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new(name)
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("hiking")
    assert_equal "hiking", activity.name
  end

  def test_it_can_have_a_different_name
    activity = Activity.new("bowling")
    assert_equal "bowling", activity.name
  end

  def test_it_can_have_a_different_name
    activity = Activity.new("bowling")
    assert_equal "bowling", activity.name
  end

  def test_it_has_no_participants_to_start
    activity = Activity.new("bowling")
    assert_empty activity.participants
  end

  def test_participants_populates_with_participant
    activity = Activity.new("bowling")
    julie = {name: "Julie Smith", amt_paid: 5}
    activity.participants << julie
    assert_equal [{name: "Julie Smith", amt_paid: 5}], activity.participants
  end

  def test_participants_populates_with_different_participant
    activity = Activity.new("bowling")
    daniel = {name: "Daniel Slater", amt_paid: 7}
    activity.participants << daniel
    assert_equal [{name: "Daniel Slater", amt_paid: 7}], activity.participants
  end

  def test_can_add_multiple_participants
    activity = Activity.new("bowling")
    jack = {name: "Jack Bennet", amt_paid: 14}

    activity.add_participants(jack)
    assert_equal [{name: "Jack Bennet", amt_paid: 14}], activity.participants

    julie = {name: "Julie Smith", amt_paid: 5}

    activity.add_participants(julie)
    assert_equal [{name: "Jack Bennet", amt_paid: 14}, {name: "Julie Smith", amt_paid: 5}], activity.participants
  end
end

=begin README
# An Activity has a name, such as 'hiking'
# An Activity has participants
  - participants are represented with a hash and have a name and an amount they've paid for that activity
# You can add participants to an Activity
You can evaluate the total cost of an activity
=end
