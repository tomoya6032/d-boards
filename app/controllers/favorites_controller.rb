class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      chat = Chat.find(params[:chat_id])
      chat.favorites.create!(user_id: current_user.id)
      redirect_to chat_path(chat)

      # @article_likes = Like.find_by(user_id: current_user.id, article_id: params[:article_id])
      # @article_likes.destroy
      # redirect_to article_path(params[:article_id])
    end
    
    def destroy
      chat = Chat.find(params[:chat_id])
      favorite = chat.favorites.find_by!(user_id: current_user.id)
      favorite.destroy!
      redirect_to chat_path(chat)
    end

end
