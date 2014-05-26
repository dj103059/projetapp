class AnecdotesController < ApplicationController

  def index
    @anecdotes = Anecdote.paginate(page: params[:page])
  end

  def show
    @anecdote = Anecdote.find(params[:id])
  end

  def create
    @anecdote = current_user.anecdotes.build(anecdote_params)
    if @anecdote.save
      flash[:success] = "anecdote created!"
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

  def destroy
  end
   private

    def anecdote_params
      params.require(:anecdote).permit(:content)
    end
end