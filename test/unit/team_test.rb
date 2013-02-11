require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test "Team name must not be empty" do
    team = Team.new
    assert team.invalid?
    assert team.errors[:name].any?
  end


  test "Team name must be unique" do
    team = Team.new(:name => "a")
    assert team.valid?
    team.save
    team = Team.new(:name => "a")
    assert team.invalid?
  end


  test "How many method" do
    first_team = Team.first
    assert_equal first_team.how_many?(Term.first),  3
  end

  test "All member methed" do
    first_team = Team.first
    first_term = Term.first
    assert_equal first_team.how_many?(first_term), first_team.all_members?(first_term).count
  end
end
