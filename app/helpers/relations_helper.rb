module RelationsHelper

 def current_relation=(relation)
     @current_relation = relation
    end

    def current_relation
     @current_relation
    end
def signed_in?
    !current_user.nil?
  end
end