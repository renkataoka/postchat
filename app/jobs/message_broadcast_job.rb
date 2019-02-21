class MessageBroadcastJob < ApplicationJob
  queue_as :default

  #新規作成されたmessageを引数とする。ルームIDで指定したチャンネルにメッセージを追加する。
  def perform(message)
    ActionCable.server.broadcast "chat_channel_#{message.room_id}",
                                 message: render_message(message)
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message',
                                            locals: {message: message } )
    end
end
