class ScenesController < ApplicationController

  def index
    @scenes = Scene.paginate(page: params[:page])
  end

  def show
    @scene = Scene.find(params[:id])
  end
 
  def new
    
  end

  def createScetoChap
   current_scene = Scene.find_by_id(params[:relation][:scene_id])
   @chapter = Chapter.find_by_id(params[:relation][:chapter_id])
   #if current_scene.chapter_id.blank?
      current_scene.update_attributes(chapter_id: @chapter.id)
      redirect_to @chapter
   #else
    # redirect_to @chapter
   #end
 end


 def create
     @scene = current_user.scenes.build(scene_params_content)
     if @scene.save
        flash[:success] = "scene created!"
        current_scene=(@scene)
        current_scene.update_attributes(scene_params_chapter)
        current_scene.relations.create(scene_params_char)
        redirect_to  current_user
     else
        render 'static_pages/home'
     end
 end
 
 def edit
 end

  def destroy
  end

  private

    def scene_params_content
      params.require(:scene).permit(:content)
    end

    def scene_params_char
      params.require(:scene).permit(:character_id)
    end
    def scene_params_chapter
      params.require(:scene).permit(:chapter_id)
    end
end