# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

User.delete_all
User.reset_pk_sequence

Chatroom.delete_all
Chatroom.reset_pk_sequence

Message.delete_all
Message.reset_pk_sequence

dan = User.create(username: "dan", password: "123")
anna = User.create(username: "anna", password: "123")

message1 = Message.create(chatroom_id: 1, user_id: anna.id, content: "hi")
