class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful!'
      redirect_to root_url
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
