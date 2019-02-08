require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "PostChat"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get new" do
    get new_chat_url
    assert_response :success
  end

  test "should get contact" do
    get contact_chats_url
    assert_response :success
  end
end
