class StudySessionsController < ApplicationController
  def new
    @studySession = StudySession.new
  end

  def create
    user = User.find(session[:user_id])
    @studySession = user.studySessions.create(study_session_params)
    if @studySession.save
      redirect_to "/study_sessions/#{@studySession.id}"
    else
      flash[:error] = @studySession.errors.full_messages.to_sentence
      redirect_to "/study_sessions/new"
    end
  end

  def show
    @studySession = StudySession.find(params[:id])
  end

  def destroy
    @studySession = StudySession.find(params[:id])
    @studySession.destroy
    redirect_to "/"
  end

  private

  def study_session_params
    study_session_params = {}
    study_session_params[:topic] = params[:topic]
    study_session_params[:duration] = params[:duration].to_i
    if params[:paired] == "1"
      study_session_params[:paired] = true
    else
      study_session_params[:paired] = false
    end
    study_session_params
  end
end
