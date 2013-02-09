require 'test_helper'

class AffectationsControllerTest < ActionController::TestCase
  setup do
    @affectation = affectations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affectations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affectation" do
    assert_difference('Affectation.count') do
      post :create, affectation: { team_id: @affectation.team_id, term_id: @affectation.term_id, user_id: @affectation.user_id }
    end

    assert_redirected_to affectation_path(assigns(:affectation))
  end

  test "should show affectation" do
    get :show, id: @affectation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @affectation
    assert_response :success
  end

  test "should update affectation" do
    put :update, id: @affectation, affectation: { team_id: @affectation.team_id, term_id: @affectation.term_id, user_id: @affectation.user_id }
    assert_redirected_to affectation_path(assigns(:affectation))
  end

  test "should destroy affectation" do
    assert_difference('Affectation.count', -1) do
      delete :destroy, id: @affectation
    end

    assert_redirected_to affectations_path
  end
end
