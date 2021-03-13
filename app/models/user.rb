class User < ApplicationRecord

    has_secure_password

    has_many :sent_messages, foreign_key: :sender_id, class_name: 'Chatroom', dependent: :destroy
    has_many :receivers, through: :sent_messages

    has_many :recieved_messages, foreign_key: :receiver_id, class_name: 'Chatroom', dependent: :destroy
    has_many :senders, through: :recieved_messages

end
