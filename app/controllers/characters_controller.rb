class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      flash[:success] = "character created!"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end
   private

    def character_params
      params.require(:character).permit(:name)
    end
end