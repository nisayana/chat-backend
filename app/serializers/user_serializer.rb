class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :sent_messages, :recieved_messages
end
