require 'test_helper'

class QuestionsetsControllerTest < ActionController::TestCase
  setup do
    @questionset = questionsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionset" do
    assert_difference('Questionset.count') do
      post :create, questionset: {  }
    end

    assert_redirected_to questionset_path(assigns(:questionset))
  end

  test "should show questionset" do
    get :show, id: @questionset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionset
    assert_response :success
  end

  test "should update questionset" do
    put :update, id: @questionset, questionset: {  }
    assert_redirected_to questionset_path(assigns(:questionset))
  end

  test "should destroy questionset" do
    assert_difference('Questionset.count', -1) do
      delete :destroy, id: @questionset
    end

    assert_redirected_to questionsets_path
  end
end
