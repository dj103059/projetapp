module CharactersHelper

 def current_character=(character)
     @current_character = character
    end

    def current_character
     @current_character
    end
def signed_in?
    !current_user.nil?
  end
end