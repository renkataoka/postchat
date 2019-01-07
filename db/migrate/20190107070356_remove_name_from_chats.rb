class RemoveNameFromChats < ActiveRecord::Migration[5.1]
  def change
    remove_column :chats, :name, :string
  end
end
