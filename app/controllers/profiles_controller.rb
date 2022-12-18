class ProfilesController < ApplicationController

   before_action :authenticate_user!

   def index


   end
  
  
   def show
  
  
   end
  
  
   def new
  
  
   end
  
  
   def create
  
  
   end
  
  
   def edit
  
  
   end
  
  
   def update
  
  
   end
  
 
   def destroy
  
  
   end

   def profile_params
     params.require(:profile).permit(
         :nickname,
         :introduction,
         :gender,
         :birthday,
         :subscribed,
         :avatar
     )
   end

  


end
