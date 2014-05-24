class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def create
    @scene = current_user.scenes.build(scene_params)
    if @scene.save
      flash[:success] = "Scene created!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end
   private

    def scene_params
      params.require(:scene).permit(:content)
    end
end