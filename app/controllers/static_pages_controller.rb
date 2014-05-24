class StaticPagesController < ApplicationController
  def home
   @scene = current_user.scenes.build if signed_in?
  end
  def about
    @title = "about"
  end
  def contact
    @title = "contact"
  end 
end
