require "./test/test_helper"
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new("location")
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_location
    reunion = Reunion.new("Dallas")
    assert_equal "Dallas", reunion.location
  end

  def test_it_can_have_a_different_location
    reunion = Reunion.new("Phoenix")
    assert_equal "Phoenix", reunion.location
  end

  def test_activities_start_as_empty
    reunion = Reunion.new("Phoenix")
    assert_empty reunion.activities
  end

  def test_can_add_activities
    reunion = Reunion.new("Phoenix")
    hiking = Activity.new("hiking", 30.00)
    reunion.activities << hiking
    assert_equal "hiking", reunion.activities[0].name
    assert_equal 30.00, reunion.activities[0].price
    assert_instance_of Activity, reunion.activities[0]
  end

  def test_can_add_other_activities
    reunion = Reunion.new("Phoenix")
    hiking = Activity.new("hiking", 30.00)
    bowling = Activity.new("bowling", 50.00)
    curling = Activity.new("curling", 80.00)

    reunion.activities << hiking
    reunion.activities << bowling
    reunion.activities << curling

    assert_equal "bowling", reunion.activities[1].name
    assert_equal 50.00, reunion.activities[1].price
    assert_instance_of Activity, reunion.activities[1]

    assert_equal "curling", reunion.activities[2].name
    assert_equal 80.00, reunion.activities[2].price
    assert_instance_of Activity, reunion.activities[2]
  end

  def test_can_evaluate_the_total_cost_of_a_reunion
    reunion = Reunion.new("Phoenix")
    hiking = Activity.new("hiking", 30.00)
    bowling = Activity.new("bowling", 50.00)
    curling = Activity.new("curling", 80.00)

    reunion.activities << hiking
    reunion.activities << bowling
    reunion.activities << curling

    assert_equal 160.00, reunion.total_cost
  end

  def test_can_evaluate_a_different_total_cost_of_a_reunion
    reunion = Reunion.new("Phoenix")
    hangliding = Activity.new("hangliding", 555.00)
    skydiving = Activity.new("skydiving", 400.29)
    snorkeling = Activity.new("snorkeling", 250.00)

    reunion.activities << hangliding
    reunion.activities << skydiving
    reunion.activities << snorkeling

    assert_equal 1205.29, reunion.total_cost
  end
end


=begin README
Add to the existing Reunion class so that it supports the following functionality.

  # You can evaluate the total cost of a Reunion
  You can create a total breakdown of the Reunion which figures out who owes/is owed how much
    Consider all of the Activities
    If a participant paid less than their fair share they owe a positive amount.
    If a participant paid more than their fair share they owe a negative amount (meaning they are owed money).
  You can print a summary of total owed amounts per person
=end
