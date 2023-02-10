class RemoveContentFromChats < ActiveRecord::Migration[6.0]
  def change
    remove_column :chats, :content, :text
  end
end
