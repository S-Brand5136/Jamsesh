require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  # init test data
  let!(:users) { create_list(:user, 1) }
  let(:user_id) { users.first.id }

  let!(:sessions) { create_list(:session, 10) }
  let(:session_id) { sessions.first.id }

  # Test suite for GET /sessions
  describe "GET /sessions" do
    before { get '/sessions' }

    it 'returns sessions' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /sessions/:id
  describe 'GET /sessions/:id' do
    before { get "/sessions/#{session_id}" }
    
    context 'when the session exists' do
      it 'returns the session' do
        expect(json).not_to be_empty
        expect(json.first['session'])
        expect(json.last['owner'])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the session does not exist' do
      let(:session_id) { -1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Session/)
      end
    end
  end

  # Test suite for POST /sessions
  describe 'POST /sessions' do
    context 'when the request is valid' do

        it 'creates a new session' do
          session = { 
            user_id: sessions.first.user_id, 
            session_title: 'example title',
            spots_available: 10, 
            total_spots: 1, 
            start_date: '2021-07-21 ', 
            start_time: '2021-07-22 12:30:59 -0700', 
            end_time: '2021-07-22 1:30:59 -0700', 
          }
          post '/sessions', params: session

          expect(json['session_title'])
          expect(response).to have_http_status(200);
        end
      end
    

    context 'when the request is invalid' do
      it 'returns a status code 401' do
        session = { 
          user_id: sessions.first.user_id,  
          session_title: '',
          spots_available: -1, 
          total_spots: -1, 
          start_date: ' ', 
          start_time: '', 
          end_time: '', 
        }
        post '/sessions', params: session       
        expect(response).to have_http_status(422)
        expect(response.body).to match(/Validation failed: /)
      end
    end
  end

  # Test suite for PUT /sessions/:id
  describe 'PUT /sessions/:id' do
    context 'when the session exists' do
      before { put "/sessions/#{session_id}", params: { session_title: 'exampleTest' } }

      it 'updates the session' do 
        expect(json).not_to be_empty
        expect(json['session_title']).to eq('exampleTest')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /sessions/:id
  describe 'DELETE /sessions/:id' do
    before { delete "/sessions/#{session_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end