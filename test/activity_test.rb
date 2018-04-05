require "./test/test_helper"
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new(name, 0.00)
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("hiking", 10.00)
    assert_equal "hiking", activity.name
  end

  def test_it_can_have_a_different_name
    activity = Activity.new("bowling", 60.00)
    assert_equal "bowling", activity.name
  end

  def test_it_has_no_participants_to_start
    activity = Activity.new("bowling", 60.00)
    assert_empty activity.participants
  end

  def test_participants_populates_with_individual_participant
    activity = Activity.new("bowling", 60.00)
    julie = {name: "Julie Smith", amt_paid: 60.00}
    activity.participants << julie
    assert_equal [{name: "Julie Smith", amt_paid: 60.00}], activity.participants
  end

  def test_participants_populates_with_different_participant
    activity = Activity.new("bowling", 60.00)
    daniel = {name: "Daniel Slater", amt_paid: 0.00}
    activity.participants << daniel
    assert_equal [{name: "Daniel Slater", amt_paid: 0.00}], activity.participants
  end

  def test_can_add_multiple_participants
    activity = Activity.new("bowling", 60.00)
    jack = {name: "Jack Bennet", amt_paid: 0.00}

    activity.add_participants(jack)
    assert_equal [{name: "Jack Bennet", amt_paid: 0.00}], activity.participants

    julie = {name: "Julie Smith", amt_paid: 60.00}

    activity.add_participants(julie)
    assert_equal [{name: "Jack Bennet", amt_paid: 0.00}, {name: "Julie Smith", amt_paid: 60.00}], activity.participants
  end

  def test_can_evaluate_the_total_paid_for_an_activity
    activity = Activity.new("bowling", 60.00)
    activity.add_participants({name: "Jack Bennet", amt_paid: 0.00})
    activity.add_participants({name: "Julie Smith", amt_paid: 60.00})

    assert_equal 60.00, activity.total_paid
  end

  def test_can_evaluate_a_different_total_paid_for_of_an_activity
    activity = Activity.new("bowling", 60.00)
    activity.add_participants({name: "Jack Bennet", amt_paid: 120.00})
    activity.add_participants({name: "Julie Smith", amt_paid: 0.00})

    assert_equal 120.00, activity.total_paid
  end

  def test_can_evenly_split_the_cost_of_an_activity
    activity = Activity.new("bowling", 60.00)

    julie = {name: "Julie Smith", amt_paid: 60.00}
    jack = {name: "Jack Bennet", amt_paid: 0.00}
    daniel = {name: "Daniel Slater", amt_paid: 0.00}

    activity.add_participants(julie)
    activity.add_participants(jack)
    activity.add_participants(daniel)

    assert_equal 20.00, activity.fair_share
  end

  def test_can_evenly_split_the_cost_of_an_activity
    activity = Activity.new("bowling", 70.00)

    julie = {name: "Julie Smith", amt_paid: 0.00}
    jack = {name: "Jack Bennet", amt_paid: 70.00}
    daniel = {name: "Daniel Slater", amt_paid: 0.00}

    activity.add_participants(julie)
    activity.add_participants(jack)
    activity.add_participants(daniel)

    assert_equal 23.33, activity.fair_share
  end

end

=begin README
Add to the Activity class so that it supports the following functionality. Note, it is assumed that the cost of each activity is split evenly between all participants.

  You can split the cost of an activity
  You can evaluate out how much each person is owed/owes
    - If a participant paid less than their fair share they owe a positive amount.
    - If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).
=end
