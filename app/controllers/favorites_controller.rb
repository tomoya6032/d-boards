class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      chat = Chat.find(params[:chat_id])
      chat.favorites.create!(user_id: current_user.id)
      redirect_to chat_path(chat)
    end
    
    def destroy
      chat = Chat.find(params[:chat_id])
      favorite = chat.favorites.find_by!(user_id: current_user.id)
      favorite.destroy!
      redirect_to chat_path(chat)
    end

end
