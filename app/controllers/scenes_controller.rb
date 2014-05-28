class ScenesController < ApplicationController
  before_action :signed_in_user
  def index
    @title = 'All Scene'
    @scenes = Scene.paginate(page: params[:page])
  end

  def show
    @scene = Scene.find(params[:id])
  end
 
  def new
    
  end

  def createScetoChap
   @scene = Scene.find_by_id(scene_params)
   @chapter = Chapter.find_by_id(chapt_params)
   if @scene.chapter_id.blank?      
      @scene.update_attributes(chapter_id: @chapter.id)
      flash[:success] = "Scene added!"
      redirect_to @chapter
   else
     flash[:error] = "Scene no added!"
     redirect_to @chapter
   end
 end


 def create
    if scene_params_content.blank? or scene_params_char.blank?
      flash[:error] = "invalid form !"
      redirect_to '/scene'
    else
     @scene = current_user.scenes.build(scene_params_content)
     if @scene.save
        flash[:success] = "scene created!"
        current_scene=(@scene)
        current_scene.relations.create(scene_params_char)
        redirect_to  current_user
     else
        render 'static_pages/home'
     end
    end
 end
 
 def edit
 end

  def destroy
   @scene = Scene.find_by_id(scene_params)
   @chapter = Chapter.find_by_id(chapt_params)
   if @scene.chapter_id == @chapter.id      
      @scene.update_attributes(chapter_id: nil)
      flash[:success] = "Scene deleted!"
      redirect_to @chapter
   else
     flash[:error] = "Scene no deleted!"
     redirect_to @chapter
   end
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
    
    def chapt_params
      params[:chapter][:chapter_id]
    end
     def scene_params
      params[:chapter][:scene_id]
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end