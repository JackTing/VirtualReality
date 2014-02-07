require 'test_helper'

class Unity3dsControllerTest < ActionController::TestCase
  setup do
    @unity3d = unity3ds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unity3ds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unity3d" do
    assert_difference('Unity3d.count') do
      post :create, unity3d: { category: @unity3d.category, image: @unity3d.image, info: @unity3d.info, model_path: @unity3d.model_path, name: @unity3d.name }
    end

    assert_redirected_to unity3d_path(assigns(:unity3d))
  end

  test "should show unity3d" do
    get :show, id: @unity3d
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unity3d
    assert_response :success
  end

  test "should update unity3d" do
    patch :update, id: @unity3d, unity3d: { category: @unity3d.category, image: @unity3d.image, info: @unity3d.info, model_path: @unity3d.model_path, name: @unity3d.name }
    assert_redirected_to unity3d_path(assigns(:unity3d))
  end

  test "should destroy unity3d" do
    assert_difference('Unity3d.count', -1) do
      delete :destroy, id: @unity3d
    end

    assert_redirected_to unity3ds_path
  end
end
