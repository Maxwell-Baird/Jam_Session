class UsersController < ApplicationController
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(session[:user_id] || params[:id])
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
