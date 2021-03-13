class ChatroomsController < ApplicationController

    def index
        @chatrooms = Chatroom.all
        render json: @chatrooms
    end

    def show
        @chatroom = Chatroom.find(params[:id])
        render json: @chatroom.messages
    end

    def create 
        @chatroom = Chatroom.find_by(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
        @chatroom2 = Chatroom.find_by(sender_id: params[:receiver_id], receiver_id: params[:sender_id])

        if @chatroom 
            render json: @chatroom
            ActionCable.server.broadcast 'chatroom_channel', ChatroomSerializer.new(@chatroom)
        elsif @chatroom2
          render json: @chatroom2
          ActionCable.server.broadcast 'chatroom_channel', ChatroomSerializer.new(@chatroom2)
        else
          @conversation=Conversation.create!(sender_id: params[:sender_id], receiver_id: params[:receiver_id])
          render json: @conversation
        
          ActionCable.server.broadcast 'chatroom_channel', ChatroomSerializer.new(@conversation)
        end
    end

end
