class ChatChannel < ApplicationCable::Channel
  #購読するルームをルームIDで指定
  def subscribed
    stream_from "chat_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #送信者と受信者を探し、User#send_messageを使って新規メッセージを作成。
  def speak(data)
    from_user = User.find_by(id: data['from_id'].to_s)
    to_user = User.find_by(id: data['to_id'].to_s)
    from_user.send_message(from_user, to_user, data['room_id'], data['content'])
  end
end
