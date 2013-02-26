require 'test_helper'

class CollanasControllerTest < ActionController::TestCase
  setup do
    @collana = collanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collana" do
    assert_difference('Collana.count') do
      post :create, collana: { nome: @collana.nome }
    end

    assert_redirected_to collana_path(assigns(:collana))
  end

  test "should show collana" do
    get :show, id: @collana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collana
    assert_response :success
  end

  test "should update collana" do
    put :update, id: @collana, collana: { nome: @collana.nome }
    assert_redirected_to collana_path(assigns(:collana))
  end

  test "should destroy collana" do
    assert_difference('Collana.count', -1) do
      delete :destroy, id: @collana
    end

    assert_redirected_to collanas_path
  end
end
