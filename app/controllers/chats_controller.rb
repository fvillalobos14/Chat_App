class ChatsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @chats = Chat.all
    end

    def new
        @chat = Chat.new
        @users = User.all
    end

    def create
        if Chat.between(params[:sender_id], params[:recipient_id]).present?
            @chat = Chat.between(params[:sender_id], params[:recipient_id]).first
        else
            @chat = Chat.create(chat_params)
        end

        # make sure to add conditions for when the chat already exists 
        redirect_to chats_path
    end

    def show 
        @chat= Chat.find(params[:id])
    end

    def destroy 
        @chat = Chat.find(params[:id])
        @chat.destroy
       
        redirect_to chats_path
    end

    private 
        def chat_params
            params.permit(:sender_id,:recipient_id)
        end
end
