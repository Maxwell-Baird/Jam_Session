class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:error] = 'Your email or password was incorrect'
      render :new
    end
  end

  def update
    user = User.find_by(email: params[:session][:email])
    expires = Time.now + 3600
    user.update(spotify_token: spotify_info['credentials']['token'],
                refresh_token: spotify_info['credentials']['refresh_token'],
                token_expiration: expires )
    redirect_to dashboard_path
  end

  private

  def spotify_info
    request.env['omniauth.auth']
  end
end
