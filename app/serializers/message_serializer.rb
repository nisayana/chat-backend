class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user

  belongs_to :chatroom
  
end
