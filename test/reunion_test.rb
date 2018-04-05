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
end


=begin README

=end
