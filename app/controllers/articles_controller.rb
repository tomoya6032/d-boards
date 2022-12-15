class ArticlesController < ApplicationController

   def index
     @articles = Article.all

   end


   def show


   end


   def new
      @article = Article.new
      # @article = current_user.articles.build

   end


   def create
   #    @article = current_user.articles.build(article_params)
   #   if @article.save
   #     redirect_to article_path(@article), notice: '保存ができたよ'
   #   else
   #     flash.now[:error] = '保存に失敗しました'
   #     render :new
   #   end

   end


   def edit


   end


   def update


   end

   def destroy


   end

end