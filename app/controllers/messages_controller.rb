class MessagesController < ApplicationController

    def index 
        @messages = Message.all
        render json: @messages
    end

    def show
        @message = Message.find(params[:id])
    end

    def create 
        message = Message.create!(user_id: params[:user_id], content: params[:content], chatroom_id: params[:chatroom_id])
        if message.valid?
            ActionCable.server.broadcast 'chatroom_channel', MessageSerializer.new(message)
        end
    end

end
