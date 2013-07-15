class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = 'Login successful!'
      redirect_to session[:redirect_to] || root_url
      session.delete(:redirect_to)
    else
      flash.now[:error] = 'Username/password combination is invalid.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout successful.'
    redirect_to root_url
  end

end
