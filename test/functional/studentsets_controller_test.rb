require 'test_helper'

class StudentsetsControllerTest < ActionController::TestCase
  setup do
    @studentset = studentsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studentsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studentset" do
    assert_difference('Studentset.count') do
      post :create, studentset: { name: @studentset.name }
    end

    assert_redirected_to studentset_path(assigns(:studentset))
  end

  test "should show studentset" do
    get :show, id: @studentset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studentset
    assert_response :success
  end

  test "should update studentset" do
    put :update, id: @studentset, studentset: { name: @studentset.name }
    assert_redirected_to studentset_path(assigns(:studentset))
  end

  test "should destroy studentset" do
    assert_difference('Studentset.count', -1) do
      delete :destroy, id: @studentset
    end

    assert_redirected_to studentsets_path
  end
end
