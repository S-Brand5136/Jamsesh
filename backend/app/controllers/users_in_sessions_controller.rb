class UsersInSessionsController < ApplicationController

  before_action :set_session, only: [:create]
  before_action :set_removal, only: [:destroy]

  # GET /attendees/:id
  def show
    @attendees = UsersInSession.find_by(session_id: params[:id])
    json_response(@attendees)
  end

  # PUT /attendees/:id 
  def create
    if @session.spots_available > 0
      @attendee = UsersInSession.create!(attendees_params)
      @session.spots_available - 1
      @session.save()
      json_response(@attendee)
    else
      json_response({msg: 'All spots full!'}, 401)
    end
  end

  # DELETE /attendees/:id/user/:id
  def destroy
    @removal.destroy
    head :no_content
  end

  private 

  def attendees_params
    # whitelist params
    params.permit(:session_id, :user_id)
  end

  def set_session
    @session = Session.find(params[:session_id])
  end

  def set_removal
    @removal = UsersInSession.find(params[:id])
  end

end
