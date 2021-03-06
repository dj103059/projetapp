class ChaptersController < ApplicationController
 before_action :signed_in_user
  def index
    @title = 'All Chapter'
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
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end