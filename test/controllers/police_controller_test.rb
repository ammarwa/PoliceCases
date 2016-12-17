require 'test_helper'

class PoliceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @police = police(:one)
  end

  test "should get index" do
    get police_index_url
    assert_response :success
  end

  test "should get new" do
    get new_police_url
    assert_response :success
  end

  test "should create police" do
    assert_difference('Police.count') do
      post police_index_url, params: { police: { name: @police.name, password: @police.password, police_id: @police.police_id, username: @police.username } }
    end

    assert_redirected_to police_url(Police.last)
  end

  test "should show police" do
    get police_url(@police)
    assert_response :success
  end

  test "should get edit" do
    get edit_police_url(@police)
    assert_response :success
  end

  test "should update police" do
    patch police_url(@police), params: { police: { name: @police.name, password: @police.password, police_id: @police.police_id, username: @police.username } }
    assert_redirected_to police_url(@police)
  end

  test "should destroy police" do
    assert_difference('Police.count', -1) do
      delete police_url(@police)
    end

    assert_redirected_to police_index_url
  end
end
