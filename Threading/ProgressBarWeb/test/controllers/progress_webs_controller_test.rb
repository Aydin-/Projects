require 'test_helper'

class ProgressWebsControllerTest < ActionController::TestCase
  setup do
    @progress_web = progress_webs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progress_webs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create progress_web" do
    assert_difference('ProgressWeb.count') do
      post :create, progress_web: { url: @progress_web.url }
    end

    assert_redirected_to progress_web_path(assigns(:progress_web))
  end

  test "should show progress_web" do
    get :show, id: @progress_web
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @progress_web
    assert_response :success
  end

  test "should update progress_web" do
    patch :update, id: @progress_web, progress_web: { url: @progress_web.url }
    assert_redirected_to progress_web_path(assigns(:progress_web))
  end

  test "should destroy progress_web" do
    assert_difference('ProgressWeb.count', -1) do
      delete :destroy, id: @progress_web
    end

    assert_redirected_to progress_webs_path
  end
end
