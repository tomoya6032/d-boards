class ReplysController < ApplicationController
    before_action :set_reply, only: [:show]

    def index
    #   @comments = Comment.all     
    
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
        @reply = chat.replys.build(reply_params)
        if @reply.save
            redirect_to chat_path(chat), notice: 'コメントを追加' 
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
      params.require(:comment).permit(:content, :chat_id, :user_id, :parent_id)
    end

    def set_chat
      @reply = Reply.find(params[:id])
    end
end