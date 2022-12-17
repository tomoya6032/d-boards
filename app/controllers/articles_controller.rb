class ArticlesController < ApplicationController

  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
      @articles = Article.all

    end


    def show
      # @article = Article.find(params[:id])

    end


    def new
      # @article = Article.new
      @article = current_user.articles.build

    end


    def create
      @article = current_user.articles.build(article_params)
      if @article.save
        redirect_to article_path(@article), notice: '保存ができたよ'
      else
        flash.now[:error] = '保存に失敗しました'
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
    def article_params
      params.require(:article).permit(:title, :content, :eyecatch)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end