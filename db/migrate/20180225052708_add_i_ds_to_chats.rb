class AddIDsToChats < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :sender_id, :integer
    add_column :chats, :recipient_id, :integer
  end
end
