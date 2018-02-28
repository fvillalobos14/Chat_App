class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index
        @messages = Message.all
    end

    def new 
        @message = Message.new
    end

    def create 
        @chat = Chat.find(params[:chat_id])
        @message = @chat.messages.create(message_params)

        if @message.save 
            redirect_to chat_path(@chat)
        else 
            redirect_to chats_path
        end
    end

    def show 
        @message = Message.find(params[:id])
    end 

    def edit 
        @message = Message.find(params[:id])
    end

    def update 
        @message = Message.find(params[:id])
 
        if @message.update(message_params)
            redirect_to @message
        else
            render 'edit'
        end
    end

    def destroy 
        @message = Message.find(params[:id])
        @message.destroy
       
        redirect_to chat_messages_path
    end

    private
    def message_params
        params.require(:message).permit(:text,:user_id)
      end
end
