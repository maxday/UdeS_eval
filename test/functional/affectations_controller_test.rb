require 'test_helper'

class AffectationsControllerTest < ActionController::TestCase

  setup do
    @affectation = affectations(:one)

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
    assert_not_nil assigns(:affectations)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create affectation" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Affectation.new)

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Affectation.new)

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Affectation.new)
  end

  test "should show affectation" do
    ability = Ability.new(@student)
    assert ability.cannot?(:show, @affectation)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @affectation)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @affectation)

    sign_in @administrator
    get :show, id: @affectation
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @affectation
    assert_response :success
  end

  test "should update affectation" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @affectation)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @affectation)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @affectation)
  end

  test "should destroy affectation" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Affectation.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Affectation.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Affectation.first)
  end
end