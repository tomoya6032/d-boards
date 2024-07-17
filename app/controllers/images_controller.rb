class ImagesController < ApplicationController
    before_action :authenticate_user!  # ログイン必須
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    def index
        @images = Image.all
  
    end

    def show
        @image = Image.find(params[:id])
    end
    
    def new
    #   @image = Image.new
      @image = current_user.images.build
    end
  
    def create
      @image = current_user.images.build(image_params)
      if @image.save
          redirect_to images_path, notice: "画像をアップロードしました。"
      else
        render :new
      end
    end
  
    

    def edit
      @image = Image.find(params[:id])
    end
      
    def update
      @image = current_user.images.find(params[:id])
      
      if @image.update(image_params)
          redirect_to images_path, notice: "画像を更新しました。"
      else
          render :edit
      end
    end
      
    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      
      redirect_to images_path, notice: "画像を削除しました。"
    end
  
    private
  
      def image_params
        params.require(:image).permit(:title, :images)
      end

      def set_image
        @image = Image.find(params[:id])
      end
end
