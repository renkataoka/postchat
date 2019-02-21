# require 'test_helper'
#
# class MessageTest < ActiveSupport::TestCase
#   def setup
#     @message = Message.new(from_id: users(:michael).id,
#                            to_id: users(:archer).id,
#                            room_id: "#{users(:michael).id}-#{users(:archer).id}",
#                            content: "content")
#   end
#
#   test "should be valid" do
#     assert @message.valid?
#   end
#
#   test "from id should be present" do
#     @message.from_id = nil
#     assert_not @message.valid?
#   end
#
#   test "to id should be present" do
#     @message.to_id = nil
#     assert_not @message.valid?
#   end
#
#   test "room id should be present" do
#     @message.room_id = nil
#     assert_not @message.valid?
#   end
#
#   test "content should be present" do
#     @message.content = "  "
#     assert_not @message.valid?
#   end
#
#   test "content should be at most 140 characters" do
#     @message.content = "a" * 141
#     assert_not @message.valid?
#   end
#
# end
