class CommentsController < ApplicationController
   before_action :set_comment, only: [:show]
#  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

   def index    

   end
  
  
   def show
     
      @comment = Comment.find_by(id: params[:id])
      @user = User.find_by(id: @comment.user_id)
      @comments = @article.comments
   end
  
  
   def new
      article = Article.find(params[:article_id])
      @comment = article.comments.build
  
   end
  
  
   def create
      article = Article.find(params[:article_id])
      @comment = article.comments.build(comment_params.merge!(user_id: current_user.id))
      if @comment.save
        redirect_to article_path(article), notice: 'コメントを追加' 
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
   def comment_params
     params.require(:comment).permit(:content, :chat_id, :user_id)
   end

   def set_article
     @comment = Comment.find(params[:id])
   end

end
