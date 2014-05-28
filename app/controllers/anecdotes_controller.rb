class AnecdotesController < ApplicationController
before_action :signed_in_user

  def index
    @title = 'All Anecdote'
    @anecdotes = Anecdote.paginate(page: params[:page])
  end

  def show
    @anecdote = Anecdote.find(params[:id])
  end

  def createAnetoChap
   if !anecdote_params_id.blank? and !chapt_params_id.blank?
   current_anectode = Anecdote.find_by_id(anecdote_params_id)
   @chapter = Chapter.find_by_id(chapt_params_id)
   if current_anectode.chapter_id.blank? and     
      current_anectode.update_attributes(chapter_id: @chapter.id)
      flash[:success] = "Anecdote added!"
      redirect_to @chapter
   else
     flash[:error] = "Anecdote no added!"
     redirect_to @chapter
   end
  else
  flash[:error] = "Anecdote or Chapter empty!"
     redirect_to root_path
 end
end
  def create
    if !anecdote_params_them.blank?
      @anecdote = current_user.anecdotes.build(anecdote_params)
      @theme = Theme.find_by_id(anecdote_params_them)
      if @anecdote.save 
        current_anecdote = @anecdote
        @theme.update_attributes(anecdote_id: current_anecdote.id)
        flash[:success] = "Anecdote created!"
        redirect_to current_user
      else
        flash[:error] = @anedote
        redirect_to root_path
      end
    else
        flash[:error] = "Create a Theme first!!"
       redirect_to root_path
    end
  end

  def destroy
   @anecdote = Anecdote.find_by_id(anecdote_params_id)
   @chapter = Chapter.find_by_id(chapt_params_id)
   if @anecdote.chapter_id == @chapter.id      
      @anecdote.update_attributes(chapter_id: nil)
      flash[:success] = "Anecdote deleted!"
      redirect_to @chapter
   else
     flash[:error] = "Anecdote no deleted!"
     redirect_to @chapter
   end
 end
   private
   
    def anecdote_params_id
      params[:chapter][:anecdote_id]
    end
    def chapt_params_id
      params[:chapter][:chapter_id]
    end
    def anecdote_params
      params.require(:anecdote).permit(:content)
    end
    def anecdote_params_them
      params[:anecdote][:theme_id]
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end