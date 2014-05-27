module ScenesHelper

 def current_scene=(scene)
     @current_scene = scene
    end

    def current_scene
     @current_scene 
    end
def signed_in?
    !current_user.nil?
  end
end