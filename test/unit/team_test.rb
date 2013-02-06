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

end
