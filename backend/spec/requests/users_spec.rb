require 'rails_helper'

RSpec.describe "Users", type: :request do
  # init test data
  let!(:user) { create_user(:user, 10) }
  let(:user_id) { user.first.id }

  # Test suite for GET /users
  describe "GET /users" do
    before { get '/users' }
    
    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Could not find User/)
      end
    end
  end

  # Test suite for POST /users
  describe 'POST /users' do
    context 'when the request is valid' do 
      user = User.new( { username: 'Bilbo', email: 'Bilbo@example.com', password: '12345' } )
      user.save()
      before { post '/users', params: { email: 'Bilbo@example.com', password: '12345' } }  

      it 'logs in a user' do
        expect(json['username']).to eq('Bilbo')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { email: '', password: '' } }

      it 'returns a status code 401' do
        expect(response).to have_http_status(401)
      end 

      it 'returns a validation failure message' do 
        expect(response.body).to match(/Error: Failed to login. Wrong email or password /)
      end
    end
  end

  # Test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    context 'when the user exists' do
      before { put "/users/#{user_id}", params: { username: 'testExample' } }

      it 'updates the user' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
        expect(json['username']).to eq('testExample')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suire for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end