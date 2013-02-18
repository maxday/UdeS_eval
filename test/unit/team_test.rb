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
    term = terms(:one)
    first_team = Team.new(:name => "abc")
    first_team.save
    Affectation.update_all(:team_id => nil)
    few_affectations = Affectation.where(:term_id => term).limit(2)
    few_affectations.update_all(:team_id => first_team.id)
    assert_equal first_team.how_many?(term),  2
  end

  test "All members" do
    term = terms(:one)
    first_team = teams(:one)
    assert_equal first_team.all_members?(term).count, first_team.how_many?(term)
  end

  test "All members but me" do
    term = terms(:one)
    first_team = teams(:one)
    user = User.find(Affectation.where(:term_id => term, :team_id => first_team).first.user_id)
    assert_equal first_team.all_members?(term).count-1, first_team.all_members_but_me?(term, user).count
  end


end
