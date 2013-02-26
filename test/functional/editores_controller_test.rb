require 'test_helper'

class EditoresControllerTest < ActionController::TestCase
  setup do
    @editore = editores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editore" do
    assert_difference('Editore.count') do
      post :create, editore: { nome: @editore.nome }
    end

    assert_redirected_to editore_path(assigns(:editore))
  end

  test "should show editore" do
    get :show, id: @editore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editore
    assert_response :success
  end

  test "should update editore" do
    put :update, id: @editore, editore: { nome: @editore.nome }
    assert_redirected_to editore_path(assigns(:editore))
  end

  test "should destroy editore" do
    assert_difference('Editore.count', -1) do
      delete :destroy, id: @editore
    end

    assert_redirected_to editores_path
  end
end
