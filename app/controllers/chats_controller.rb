class ChatsController < ApplicationController


   def index
     @chats = Chat.all

   end
 
 
   def show
     @chats = Chat.all
 
   end
 
 
   def new
      @chats = Chat.all
      @chat = Chat.new
 
   end
 
 
   def create
      @chat = Chat.new(text: params[:chat][:text])
    if @chat.save
      ActionCable.server.broadcast 'room_channel', {content: @chat}
    end
   end
 
 
   def edit
 
 
   end
 
 
   def update
 
 
   end
 

   def destroy
 
 
   end
 
end

