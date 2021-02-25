require "test_helper"

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participations_new_url
    assert_response :success
  end

  test "should get create" do
    get participations_create_url
    assert_response :success
  end

  test "should get update" do
    get participations_update_url
    assert_response :success
  end

  test "should get edit" do
    get participations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get participations_destroy_url
    assert_response :success
  end

  test "should get index" do
    get participations_index_url
    assert_response :success
  end

  test "should get show" do
    get participations_show_url
    assert_response :success
  end
end
