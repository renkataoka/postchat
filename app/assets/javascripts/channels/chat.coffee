App.chat = null

#ビューの中にセットした値を取得する。
current_user_id = ->
  $('input:hidden[name="from_id"]').val()
user_id = ->
  $('input:hidden[name="to_id"]').val()
room_id = ->
  $('input:hidden[name="room_id"]').val()
#ルームIDが指定されているかをチェック、指定されていればハッシュを返す。
room_ch = ->
  id = room_id()
  if id?
    return { channel: 'ChatChannel', room_id: id}
  else
    return null

#メッセージの高さの合計を求める。
messages_height = ->
  temp = 0;
  $("div.message").each ->
    temp += ($(this).height());
  return temp

#ページが遷移したとき、購読を解除
document.addEventListener 'turbolinks:request-start', ->
  if room_ch()?
    App.chat.unsubscribe()

#ページが読み込まれたとき、購読を開始
document.addEventListener 'turbolinks:load', ->
  if room_ch()?
    App.chat = App.cable.subscriptions.create room_ch(),
      #受信時の処理
      received: (data) ->
        $('#messages').append data['message']  #メッセージを追加
        $('section.message_box').scrollTop(messages_height());
      #送信時の処理
      speak: (from_id, to_id, room_id, content) ->
        @perform 'speak', {  #chat_channel.rbのspeakメソッドを呼び出す。
          "from_id": from_id
          "to_id": to_id
          "room_id": room_id
          "content": content
        }

#Enterキーが押されたときのイベントの処理
$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
  if event.which is 13
    value = event.target.value
    if value.length > 0 && value.length <= 140
      App.chat.speak(current_user_id(), user_id(), room_id(), value)
      event.target.value = ''
      event.preventDefault()
    else
      event.target.value = ''
      event.preventDefault()
  #
  # connected: ->
  #   # Called when the subscription is ready for use on the server
  #
  # disconnected: ->
  #   # Called when the subscription has been terminated by the server
  #
  # received: (data) ->
  #   # Called when there's incoming data on the websocket for this channel
  #
  # speak: ->
  #   @perform 'speak'
