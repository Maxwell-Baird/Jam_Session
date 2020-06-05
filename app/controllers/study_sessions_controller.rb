class StudySessionsController < ApplicationController
  before_action :current_user!

  def new
    @studySession = StudySession.new
  end

  def create
    user = User.find(session[:user_id])
    @studySession = user.study_sessions.create(study_session_params)
    if @studySession.save
      redirect_to "/study_sessions/#{@studySession.id}"
    else
      flash[:error] = @studySession.errors.full_messages.to_sentence
      redirect_to "/study_sessions/new"
    end
  end

  def show
    @studySession = StudySession.find(params[:id])
    @quote = SearchResults.new.get_quote
    playlist_handler
  end

  def destroy
    @studySession = StudySession.find(params[:id])
    @studySession.destroy
    redirect_to "/"
  end

  private

  def study_session_params
    paired_param_converter(params)
    params[:duration] = params[:duration].to_i
    params.permit(:topic, :duration, :paired)
  end

  def paired_param_converter(params)
    if params[:paired] == "1"
      params[:paired] = true
    else
      params[:paired] = false
    end
  end

  def playlist_handler
    if current_user.spotify_token.present?
      @playlists = SearchResults.new.get_playlists(current_user.spotify_token)
    end
  end

  def current_user!
    four_oh_four unless current_user
  end
end
