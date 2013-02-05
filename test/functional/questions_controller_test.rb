require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  setup do
    @question = questions(:one)

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
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create question" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Question.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Question.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Question.new(:name=>"a"))
  end

  test "should show question" do
    ability = Ability.new(@student)
    assert ability.can?(:show, @question)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @question)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @question)

    sign_in @administrator
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @question
    assert_response :success
  end

  test "should update question" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @question)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @question)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @question)
  end

  test "should destroy question" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Project.first)
  end
end
