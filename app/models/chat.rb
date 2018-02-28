class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  has_many :messages, dependent: :destroy

  scope :between, ->(sender_id, recipient_id) do 
    where("(chats.sender_id= ? AND chats.recipient_id= ?) OR (chats.sender_id= ? AND chats.recipient_id= ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

end
