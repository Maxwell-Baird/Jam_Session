# frozen_string_literal: true

class UserStudySessionsController < ApplicationController
  before_action :current_user!

  def current_user!
    four_oh_four unless current_user
  end

  def show
    @user = User.find(session[:user_id])
  end
end
