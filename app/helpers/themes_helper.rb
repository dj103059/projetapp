module ThemesHelper

 def current_theme=(theme)
     @current_theme = theme
    end

    def current_theme
     @current_theme
    end
def signed_in?
    !current_user.nil?
  end
end