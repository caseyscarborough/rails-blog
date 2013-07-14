def sign_in(user)
  session[:user_id] = user.id
end

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def authorize
  if current_user.nil?
    flash[:error] = "Not authorized."
    redirect_to login_url
  end
end