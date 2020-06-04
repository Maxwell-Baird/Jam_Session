class UsersController < ApplicationController

  def current_user!
    four_oh_four unless current_user
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def edit
    current_user!
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    current_user!
    token = current_user.spotify_token
    @quote = SearchResults.new.get_quote
    if !current_user.spotify_token.nil?
      @playlists = SearchResults.new.get_playlists(token)
      @user_selection = params["playlist-select"]
    end
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    flash[:success] = 'Account Successfully Deleted'
    redirect_to '/register'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
