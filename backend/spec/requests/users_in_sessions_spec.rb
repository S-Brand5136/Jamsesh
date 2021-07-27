require 'rails_helper'

RSpec.describe "UsersInSessions", type: :request do
  # Init test data
  let!(:sessions) { create_list(:session, 1) }
  let!(:users) { create_list(:user, 1) }

  let!(:users_in_session) { create_list(:users_in_session, 10) }
  let(:session_id) { users_in_session.first.session_id}
  let(:attendee_id) { users_in_session.first.id }

  attendee = UsersInSession.new( {user_id: 1, session_id: 1} )
  attendee.save()

  # TEST suite for GET /attendees/:id/
  describe 'GET /attendees/:id' do
    before { get "/attendees/#{session_id}" }

    it 'returns all users attending the session' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # TEST suite for POST /attendees/:id
  describe 'POST /attendees/:id' do
    context 'when the session and user exists' do
      it 'Adds user to attendees list' do
        post "/attendees", params: { session_id: sessions.first.id, user_id: users.first.id }
        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
      end
    end

    context 'When the session or user does not exist' do
      it 'returns status code 404' do
        post "/attendees", params: { session_id: -1, user_id: -1 }
        expect(response).to have_http_status(404)
      end
    end
  end

  # TEST suite for DELETE /attendees/:id/users/:id
  describe 'DELETE /attendees/:id' do
    before { delete "/attendees/#{attendee_id}"}  
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
