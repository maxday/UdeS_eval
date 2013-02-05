require 'test_helper'
include Devise::TestHelpers

class QuartersControllerTest < ActionController::TestCase

  setup do
    @quarter = quarters(:one)

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
    assert_not_nil assigns(:quarters)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create quarter" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Quarter.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Quarter.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Quarter.new(:name=>"a"))
  end

  test "should show quarter" do
    ability = Ability.new(@student)
    assert ability.can?(:show, @quarter)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @quarter)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @quarter)

    sign_in @administrator
    get :show, id: @quarter
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @quarter
    assert_response :success
  end

  test "should update quarter" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @quarter)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @quarter)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @quarter)
  end

  test "should destroy quarter" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Project.first)
  end
end
