module AnecdotesHelper

 def current_anecdote=(anecdote)
     @current_anecdote = anecdote
    end

    def current_anecdote
     @current_anecdote
    end
 def signed_in?
    !current_user.nil?
  end
end