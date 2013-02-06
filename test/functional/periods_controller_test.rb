require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase

  setup do
    @period = periods(:one)

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

    sign_in @supervisor
    get :index
    assert_response :success

    sign_in @student
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create period" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Period.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Period.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Period.new(:name=>"a"))
  end

  test "should show period" do
    ability = Ability.new(@student)
    assert ability.cannot?(:show, @period)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @period)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @period)

    sign_in @administrator
    get :show, id: @period
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @period
    assert_response :success
  end

  test "should update period" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @period)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @period)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @period)
  end

  test "should destroy period" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Period.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Period.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Period.first)
  end
end
