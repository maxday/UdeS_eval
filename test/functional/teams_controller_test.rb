require 'test_helper'
include Devise::TestHelpers

class TeamsControllerTest < ActionController::TestCase


  setup do
    @team = teams(:one)

    #Administrator
    @administrator = User.find(4)
    assert_equal(@administrator.role_ids.first, 3)

    #Supervisor
    @supervisor = User.find(3)
    assert_equal(@supervisor.role_ids.first, 2)

    #Student
    @student = User.find(1)
    assert_equal(@student.role_ids.first, 1)
  end

  test "should get index" do
    sign_in @administrator
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create team" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Team.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Team.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Team.new(:name=>"a"))
  end

  test "should show team" do
    ability = Ability.new(@student)
    assert ability.cannot?(:show, @team)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @team)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @team)

    sign_in @administrator
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @team
    assert_response :success
  end

  test "should update team" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @team)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @team)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @team)
  end

  test "should destroy team" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Team.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Team.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Team.first)
  end

end
