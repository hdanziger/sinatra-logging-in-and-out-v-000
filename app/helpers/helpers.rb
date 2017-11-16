class Helpers

  def current_user(session)

  end

  def is_logged_in?(session)
    !!session[:user_id]
  end
end
