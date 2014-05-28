class RelationsController < ApplicationController
  before_action :signed_in_user
 def index
 end 



 def show
   end

 
   def create(char_id)
     @character = Character.find_by_id(char_id)
     current_scene.act!(@character)
     redirect_to current_user
  end

  def destroy
    current_scene = Scene.find_by_id(params[:relation][:scene_id])
    @character = Character.find_by_id(params[:relation][:character_id])
    if !current_scene.playedby?(@character).blank?
       current_scene.fired!(@character)
       flash[:success] = "Character delete!"
    else
      flash[:error] = "Character no delete!" 
    end
    redirect_to current_scene
   end

 def createChrtoSce  
   current_scene = Scene.find_by_id(params[:relation][:scene_id])
   @character = Character.find_by_id(params[:relation][:character_id])
   if current_scene.playedby?(@character).blank?
      current_scene.act!(@character)
      flash[:success] = "Character added!"
      redirect_to current_scene
   else
     flash[:error] = "Character no added!"
     redirect_to current_scene
   end
 end

  

 

  private

    
   def scene_params_id
      params.require(:relation).permit(:scene_id)
    end
   def char_params_id
      params.require(:relation).permit(:character_id)
    end
   def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end