require 'test_helper'

class SwInteractionsControllerTest < ActionController::TestCase
  setup do
    @sw_interaction = sw_interactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sw_interactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sw_interaction" do
    assert_difference('SwInteraction.count') do
      post :create, sw_interaction: {  }
    end

    assert_redirected_to sw_interaction_path(assigns(:sw_interaction))
  end

  test "should show sw_interaction" do
    get :show, id: @sw_interaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sw_interaction
    assert_response :success
  end

  test "should update sw_interaction" do
    patch :update, id: @sw_interaction, sw_interaction: {  }
    assert_redirected_to sw_interaction_path(assigns(:sw_interaction))
  end

  test "should destroy sw_interaction" do
    assert_difference('SwInteraction.count', -1) do
      delete :destroy, id: @sw_interaction
    end

    assert_redirected_to sw_interactions_path
  end
end
