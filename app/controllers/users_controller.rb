class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    require "pry"; binding.pry
  end
end
