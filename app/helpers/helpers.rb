class Helpers

  def current_user(session)
    
  end

  def is_logged_in?(session)
    if session.include?(:user_id)
    else 
      false 
    end
      
  end
end