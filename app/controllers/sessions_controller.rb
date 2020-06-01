class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Your email or password was incorrect'
      render :new
    end
  end

  def update
    expires = Time.now + 3600
    if current_user
      current_user.update(uid: spotify_info['uid'],
                  spotify_token: spotify_info['credentials']['token'],
                  refresh_token: spotify_info['credentials']['refresh_token'],
                  token_expiration: expires)
    elsif user = User.find_by(uid: :spotify_info['uid'])
      session[:user_id] = user.id
      user.update(spotify_token: spotify_info['credentials']['token'],
                  refresh_token: spotify_info['credentials']['refresh_token'],
                  token_expiration: expires)
    end
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
    flash[:success] = 'Logout Successful'
  end

  private

  def spotify_info
    request.env['omniauth.auth']
  end
end
