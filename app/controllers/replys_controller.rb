class ReplysController < ApplicationController
    before_action :set_reply, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index   
    
    end
    
    
    def show
        
        @reply = Reply.find_by(id: params[:id])
        @user = User.find_by(id: @reply.user_id)
        @replys = @chat.replys
    end
    
    
    def new
        chat = Chat.find(params[:chat_id])
        @reply = chat.replys.build
    
    end
    
    
    def create
        chat = Chat.find(params[:chat_id])
        @reply = chat.replys.build(reply_params.merge!(user_id: current_user.id))
        if @reply.save
            redirect_to chat_path(chat), notice: '返信を追加' 
        else
        flash.now[:error] = '更新できませんでした'
        render :new
        end
    
    end
    
    
    def edit
    
    
    end
    
    
    def update
    
    
    end
    
    
    def destroy
    
    
    end

    private
    def reply_params
      params.require(:reply).permit(:content, :chat_id, :user_id)
    end

    def set_reply
      @reply = Reply.find(params[:id])
    end
end