class CommentsController < ApplicationController
   before_action :set_comment, only: [:show]
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

   def index    
      article = Article.find(params[:article_id])
      comments = article.comments
      render json: comments
   end
  
  
   def show
     
      # @comment = Comment.find_by(id: params[:id])
      # @user = User.find_by(id: @comment.user_id)
      # @comments = @article.comments
   end
  
  
   def new
      article = Article.find(params[:article_id])
      @comment = article.comments.build
  
   end
  
  
   def create
      article = Article.find(params[:article_id])
      @comment = article.comments.build(comment_params)
      @comment.save!
     
     render json: @comment
  
   end
  
  
   def edit
  
  
   end
  
  
   def update
  
  
   end
  
 
   def destroy
  
  
   end
  
   private
   def comment_params
     params.require(:comment).permit(:content)
   end

   def set_article
     @comment = Comment.find(params[:id])
   end

end
