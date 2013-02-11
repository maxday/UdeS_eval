require 'test_helper'

class YearsControllerTest < ActionController::TestCase

  setup do
    @year = years(:one)

    #Administrator
    @administrator = User.find(10)
    assert_equal(@administrator.role_ids.first, 3)

    #Supervisor
    @supervisor = User.find(9)
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
    assert_not_nil assigns(:years)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create year" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Year.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Year.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Year.new(:name=>"a"))
  end

  test "should show year" do
    ability = Ability.new(@student)
    assert ability.cannot?(:show, @year)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @year)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @year)

    sign_in @administrator
    get :show, id: @year
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @year
    assert_response :success
  end

  test "should update year" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @year)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @year)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @year)
  end

  test "should destroy year" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Year.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Year.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Year.first)
  end
  
end
