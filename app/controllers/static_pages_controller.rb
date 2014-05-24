class StaticPagesController < ApplicationController
  def home
  # @chapter = current_user.chapters.build if signed_in?
  end
  def about
    @title = "about"
  end
  def contact
    @title = "contact"
  end 
end
