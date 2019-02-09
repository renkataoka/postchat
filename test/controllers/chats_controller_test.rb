require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "PostChat"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get new" do
    get new_chat_path
    assert_response :success
  end

  test "should get help" do
    get help_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
  end

  test "should get chats" do
    get chats_path
    assert_response :success
  end
end
