class ChaptersController < ApplicationController

  def index
    @chapters = Chapter.paginate(page: params[:page])
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = current_user.chapters.build(chapter_params)
    if @chapter.save
      flash[:success] = "chapter created!"
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  


  def destroy
  end
   private

    def chapter_params
      params.require(:chapter).permit(:title)
    end
end