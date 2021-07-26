require 'rails_helper'

RSpec.describe "UsersInSessions", type: :request do
  # Init test data
  let!(:users) { create_list(:user, 1) }
  let(:user_id) { users.first.id }

  let!(:sessions) { create_list(:session, 10) }
  let(:session_id) { sessions.first.id }

  # TEST suite for GET /attendees/users/:id/
  describe 'GET /attendees/:id/users' do
    before { get "/attendees/#{1}/users" }

    it 'returns all users attending the session' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
  
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # TEST suite for POST /attendees/:id
  describe 'POST /attendees/:id' do
    before { get "/attendees/#{session_id}" }
    context 'when the session and user exists' do
      it 'Adds user to attendees list' do
        user = {
          user_id: 1
        }
        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
      end
    end

    let(:session_id) { -1 }
    context 'When the session or user does not exist' do
      it 'returns status code 401' do
        user = {
          user_id: -1
        }
        expect(response).to have_http_status(422)
      end
    end
  end

  # TEST suite for DELETE /attendees/:id/users/:id
  describe 'DELETE /attendees/:id/users/:id' do
    before { delete "/attendees/#{1}/users/#{1}"}  
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
