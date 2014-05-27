module ChaptersHelper

 def current_chapter=(chapter)
     @current_chapter = chapter
    end

    def current_chapter
     @current_chapter
    end
def signed_in?
    !current_user.nil?
  end
end