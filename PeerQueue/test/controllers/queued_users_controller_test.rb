require 'test_helper'

class QueuedUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queued_user = queued_users(:one)
  end

  test "should get index" do
    get queued_users_url
    assert_response :success
  end

  test "should get new" do
    get new_queued_user_url
    assert_response :success
  end

  test "should create queued_user" do
    assert_difference('QueuedUser.count') do
      post queued_users_url, params: { queued_user: { Name: @queued_user.Name, PeerHelp: @queued_user.PeerHelp, Question: @queued_user.Question, Status: @queued_user.Status } }
    end

    assert_redirected_to queued_user_url(QueuedUser.last)
  end

  test "should show queued_user" do
    get queued_user_url(@queued_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_queued_user_url(@queued_user)
    assert_response :success
  end

  test "should update queued_user" do
    patch queued_user_url(@queued_user), params: { queued_user: { Name: @queued_user.Name, PeerHelp: @queued_user.PeerHelp, Question: @queued_user.Question, Status: @queued_user.Status } }
    assert_redirected_to queued_user_url(@queued_user)
  end

  test "should destroy queued_user" do
    assert_difference('QueuedUser.count', -1) do
      delete queued_user_url(@queued_user)
    end

    assert_redirected_to queued_users_url
  end
end
