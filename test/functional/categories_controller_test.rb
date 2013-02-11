require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  setup do
    @category = categories(:one)

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
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create category" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Category.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Category.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Category.new(:name=>"a"))
  end

  test "should show category" do
    ability = Ability.new(@student)
    assert ability.cannot?(:show, @category)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @category)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @category)

    sign_in @administrator
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @category
    assert_response :success
  end

  test "should update category" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @category)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @category)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @category)
  end

  test "should destroy category" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Category.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Category.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Category.first)
  end
end
