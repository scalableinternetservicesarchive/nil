require 'test_helper'

class ShippersControllerTest < ActionController::TestCase
  setup do
    @shipper = shippers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shippers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipper" do
    assert_difference('Shipper.count') do
      post :create, shipper: { address: @shipper.address, name: @shipper.name, user_id: @shipper.user_id, zip: @shipper.zip }
    end

    assert_redirected_to shipper_path(assigns(:shipper))
  end

  test "should show shipper" do
    get :show, id: @shipper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipper
    assert_response :success
  end

  test "should update shipper" do
    patch :update, id: @shipper, shipper: { address: @shipper.address, name: @shipper.name, user_id: @shipper.user_id, zip: @shipper.zip }
    assert_redirected_to shipper_path(assigns(:shipper))
  end

  test "should destroy shipper" do
    assert_difference('Shipper.count', -1) do
      delete :destroy, id: @shipper
    end

    assert_redirected_to shippers_path
  end
end
