require 'test_helper'
include Devise::TestHelpers

class ProjectsControllerTest < ActionController::TestCase


  setup do
    @project = projects(:one)

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
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    sign_in @administrator
    get :new
    assert_response :success
  end

  test "should create project" do
    ability = Ability.new(@student)
    assert ability.cannot?(:create, Project.new(:name=>"a"))

    ability = Ability.new(@supervisor)
    assert ability.can?(:create, Project.new(:name=>"a"))

    ability = Ability.new(@administrator)
    assert ability.can?(:create, Project.new(:name=>"a"))
  end

  test "should show project" do
    ability = Ability.new(@student)
    assert ability.can?(:show, @project)

    ability = Ability.new(@supervisor)
    assert ability.can?(:show, @project)

    ability = Ability.new(@administrator)
    assert ability.can?(:show, @project)

    sign_in @administrator
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    sign_in @administrator
    get :show, id: @project
    assert_response :success
  end

  test "should update project" do
    ability = Ability.new(@student)
    assert ability.cannot?(:update, @project)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:update, @project)

    ability = Ability.new(@administrator)
    assert ability.can?(:update, @project)
  end

  test "should destroy project" do
    ability = Ability.new(@student)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@supervisor)
    assert ability.cannot?(:destroy, Project.first)

    ability = Ability.new(@administrator)
    assert ability.can?(:destroy, Project.first)
  end

end
