class RelationsController < ApplicationController
  
 def index
 end 



 def show
   end


   def create(char_id)
     @character = Character.find_by_id(char_id)
     current_scene.act!(@character)
     redirect_to current_user
  end

  #def destroy
   # @user = Relationship.find(params[:id]).followed
   #end

 def createChrtoSce
   current_scene = Scene.find_by_id(params[:relation][:scene_id])
   @character = Character.find_by_id(params[:relation][:character_id])
   if current_scene.playedby?(@character).blank?
      current_scene.act!(@character)
      redirect_to current_scene
   else
     redirect_to current_scene
   end
 end

  

  def destroy
  end

  private

    
   def scene_params_id
      params.require(:relation).permit(:scene_id)
    end
   def char_params_id
      params.require(:relation).permit(:character_id)
    end


end