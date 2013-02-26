require 'test_helper'

class ProductcollanasControllerTest < ActionController::TestCase
  setup do
    @productcollana = productcollanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productcollanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productcollana" do
    assert_difference('Productcollana.count') do
      post :create, productcollana: {  }
    end

    assert_redirected_to productcollana_path(assigns(:productcollana))
  end

  test "should show productcollana" do
    get :show, id: @productcollana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productcollana
    assert_response :success
  end

  test "should update productcollana" do
    put :update, id: @productcollana, productcollana: {  }
    assert_redirected_to productcollana_path(assigns(:productcollana))
  end

  test "should destroy productcollana" do
    assert_difference('Productcollana.count', -1) do
      delete :destroy, id: @productcollana
    end

    assert_redirected_to productcollanas_path
  end
end
