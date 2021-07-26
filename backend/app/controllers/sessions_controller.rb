require 'json'
class SessionsController < ApplicationController

  before_action :set_session, only: [:show, :update, :destroy]
  before_action :set_owner, only: [:show, :update, :destroy]

  # GET /sessions
  def index
    @sessions = Session.all
    json_response(@sessions)
  end

  # GET /sessions/:session_id
  def show 
    render json: [@session, @owner], status: :ok
  end

  # POST /sessions
  def create
    @session = Session.create!(sessions_params)
    json_response(@session)
  end

  # PUT /sessions/:session_id
  def update
    @session.update(sessions_params)
    json_response(@session)
  end

  # DELETE /sessions/:session_id
  def destroy
    @session.destroy
    head :no_content
  end

  private

  def sessions_params
    # whitelist params
    params.permit(:session_title, :start_date, :start_time, :end_time, :total_spots, :spots_available, :user_id)
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def set_owner
    @owner = User.find_by(id: @session.user_id) if @session
  end

end
