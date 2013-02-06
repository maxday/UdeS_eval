require 'test_helper'
include Devise::TestHelpers

class TermsControllerTest < ActionController::TestCase

  setup do
    @term = terms(:one)

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
    assert_not_nil assigns(:terms)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create term" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Term.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Term.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Term.new(:name=>"a"))
  end

  test "should show term" do
    ability = Ability.new(@student)
    assert ability.can?(:show, @term)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @term)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @term)

    sign_in @administrator
    get :show, id: @term
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @term
    assert_response :success
  end

  test "should update term" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @term)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @term)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @term)
  end

  test "should destroy term" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Term.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Term.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Term.first)
  end
end
