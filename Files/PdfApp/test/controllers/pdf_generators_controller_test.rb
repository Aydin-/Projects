require 'test_helper'

class PdfGeneratorsControllerTest < ActionController::TestCase
  setup do
    @pdf_generator = pdf_generators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdf_generators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf_generator" do
    assert_difference('PdfGenerator.count') do
      post :create, pdf_generator: { fd1: @pdf_generator.fd1, fd2: @pdf_generator.fd2, filepath: @pdf_generator.filepath, url: @pdf_generator.url }
    end

    assert_redirected_to pdf_generator_path(assigns(:pdf_generator))
  end

  test "should show pdf_generator" do
    get :show, id: @pdf_generator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pdf_generator
    assert_response :success
  end

  test "should update pdf_generator" do
    patch :update, id: @pdf_generator, pdf_generator: { fd1: @pdf_generator.fd1, fd2: @pdf_generator.fd2, filepath: @pdf_generator.filepath, url: @pdf_generator.url }
    assert_redirected_to pdf_generator_path(assigns(:pdf_generator))
  end

  test "should destroy pdf_generator" do
    assert_difference('PdfGenerator.count', -1) do
      delete :destroy, id: @pdf_generator
    end

    assert_redirected_to pdf_generators_path
  end
end
