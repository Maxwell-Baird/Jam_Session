# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    redirect_to dashboard_path if current_user
  end
end
