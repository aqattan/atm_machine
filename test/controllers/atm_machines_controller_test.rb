require 'test_helper'

class AtmMachinesControllerTest < ActionController::TestCase
  setup do
    @atm_machine = atm_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atm_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atm_machine" do
    assert_difference('AtmMachine.count') do
      post :create, atm_machine: { address: @atm_machine.address, latitude: @atm_machine.latitude, longitude: @atm_machine.longitude }
    end

    assert_redirected_to atm_machine_path(assigns(:atm_machine))
  end

  test "should show atm_machine" do
    get :show, id: @atm_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atm_machine
    assert_response :success
  end

  test "should update atm_machine" do
    patch :update, id: @atm_machine, atm_machine: { address: @atm_machine.address, latitude: @atm_machine.latitude, longitude: @atm_machine.longitude }
    assert_redirected_to atm_machine_path(assigns(:atm_machine))
  end

  test "should destroy atm_machine" do
    assert_difference('AtmMachine.count', -1) do
      delete :destroy, id: @atm_machine
    end

    assert_redirected_to atm_machines_path
  end
end
