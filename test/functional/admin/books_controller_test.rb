require 'test_helper'

class Admin::BooksControllerTest < ActionController::TestCase
  setup do
    @admin_book = admin_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_book" do
    assert_difference('Admin::Book.count') do
      post :create, :admin_book => @admin_book.attributes
    end

    assert_redirected_to admin_book_path(assigns(:admin_book))
  end

  test "should show admin_book" do
    get :show, :id => @admin_book.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_book.to_param
    assert_response :success
  end

  test "should update admin_book" do
    put :update, :id => @admin_book.to_param, :admin_book => @admin_book.attributes
    assert_redirected_to admin_book_path(assigns(:admin_book))
  end

  test "should destroy admin_book" do
    assert_difference('Admin::Book.count', -1) do
      delete :destroy, :id => @admin_book.to_param
    end

    assert_redirected_to admin_books_path
  end
end
