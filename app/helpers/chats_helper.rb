module ChatsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_chats_path
    elsif action_name == 'edit'
      chat_path
    end
  end
end
