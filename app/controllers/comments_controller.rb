class CommentsController < ApplicationController



   def index
     

   end
  
  
   def show
  
  
   end
  
  
   def new
      article = Article.find(params[:article_id])
      @comment = article.comments.build
  
   end
  
  
   def create
      article = Article.find(params[:article_id])
      @comment = article.comments.build(comment_params)
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
     params.require(:comment).permit(:content)
   end

end
