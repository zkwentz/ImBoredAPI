require 'test_helper'

class TravelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel = travels(:one)
  end

  test "should get index" do
    get travels_url, as: :json
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count') do
      post travels_url, params: { travel: { city_id: @travel.city_id, description: @travel.description, hide: @travel.hide, name: @travel.name, notes: @travel.notes, numofvisits: @travel.numofvisits, photo: @travel.photo, url: @travel.url, why: @travel.why } }, as: :json
    end

    assert_response 201
  end

  test "should show travel" do
    get travel_url(@travel), as: :json
    assert_response :success
  end

  test "should update travel" do
    patch travel_url(@travel), params: { travel: { city_id: @travel.city_id, description: @travel.description, hide: @travel.hide, name: @travel.name, notes: @travel.notes, numofvisits: @travel.numofvisits, photo: @travel.photo, url: @travel.url, why: @travel.why } }, as: :json
    assert_response 200
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete travel_url(@travel), as: :json
    end

    assert_response 204
  end
end
