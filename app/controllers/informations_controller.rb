class InformationsController < ApplicationController

   before_action :set_information, only: [:show]
   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

   def index
      @informations = Information.all

   end
  
  
   def show
  
  
   end
  
  
   def new
      # @information = Information.new
      @information = current_user.informations.build
  
   end
  
  
   def create
      @information = current_user.informations.build(information_params)
      if @information.save
        redirect_to information_path(@information), notice: '保存ができたよ'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
  
   end
  
  
   def edit
      @information = current_user.informations.find(params[:id])
  
   end
  
  
   def update
      @information = current_user.informations.find(params[:id])
      if @information.update(information_params)
        redirect_to information_path(@information),notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
  
   end
  
 
   def destroy
      information = current_user.articles.find(params[:id])
      information.destroy!
      redirect_to root_path, notice: '削除に成功しました'
  
   end
   
   # private
   # def information_params
   #   params.require(:information).permit(:title, :content, :eyecatch)
   # end

   def set_information
     @information = Information.find(params[:id])
   end

end
