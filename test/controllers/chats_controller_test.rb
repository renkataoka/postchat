require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest

  test "should get chats" do
    get chats_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_url
    assert_response :success
  end
end
