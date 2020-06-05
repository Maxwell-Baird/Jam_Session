# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Your email or password was incorrect'
      render :new
    end
  end

  def update
    if current_user
      update_current_user(spotify_info)
    elsif @user = User.find_by(uid: :spotify_info['uid'])
      update_user(spotify_info)
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

  def update_current_user(response_info)
    expires = Time.now + 3600
    current_user.update(uid: response_info['uid'],
                spotify_token: response_info['credentials']['token'],
                refresh_token: response_info['credentials']['refresh_token'],
                token_expiration: expires)
  end

  def update_user(response_info)
    expires = Time.now + 3600
    session[:user_id] = @user.id
    @user.update(spotify_token: response_info['credentials']['token'],
                refresh_token: response_info['credentials']['refresh_token'],
                token_expiration: expires)
  end
end
