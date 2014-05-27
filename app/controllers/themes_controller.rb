class ThemesController < ApplicationController
before_action :signed_in_user
  def index
    @themes = Theme.paginate(page: params[:page])
  end

  def show
    @theme = Theme.find(params[:id])
  end

  def createThetoAne
   current_theme = Theme.find_by_id(theme_params_id)
   @anecdote = Anecdote.find_by_id(anec_params_id)
   if current_theme.anecdote_id.blank?      
      current_theme.update_attributes(anecdote_id: @anecdote.id)
      flash[:success] = "Theme added!"
      redirect_to @anecdote
   else
     flash[:error] = "Theme no added!"
     redirect_to @anecdote
   end
 end

  def create
    @theme = current_user.themes.build(theme_params)
    if @theme.save
      flash[:success] = "theme created!"
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  def destroy
   @theme = Theme.find_by_id(theme_params_id)
   @anecdote = Anecdote.find_by_id(anec_params_id)
   if @theme.anecdote_id == @anecdote.id      
      @theme.update_attributes(anecdote_id: nil)
      flash[:success] = "Theme deleted!"
      redirect_to @anecdote
   else
     flash[:error] = "Theme no deleted!"
     redirect_to @anecdote
   end
 end
   private
   
    def theme_params_id
      params[:chapter][:theme_id]
    end
    def anec_params_id
      params[:chapter][:anecdote_id]
    end
    def theme_params
      params.require(:theme).permit(:content)
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end