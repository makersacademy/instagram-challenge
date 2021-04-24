require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do
  let(:valid_attributes) { { forename: 'Sadie', 
                                  surname: 'Smith',
                                  username: 'Ssmith',
                                  email: 'ssmith@notadomain.com',
                                  password: 'password1',
                                  profilePic: '' } }

  describe 'POST /api/login' do
    before { post '/api/users', params: valid_attributes }
                            
    context 'when the user is valid' do
      before { post '/api/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
      
      it 'return status code 200' do
        expect(json['logged_in']).to be(true)
      end

      it 'returns the user' do
        expect(json['user']['forename']).to eq('Sadie')
      end
    end
  end

  describe 'GET /api/logged_in' do
    before { post '/api/users', params: valid_attributes }

    context 'if a user is logged in' do
      before { post '/api/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
      before { get '/api/logged_in'}

      it 'returns the current_user when logged in' do
        expect(json['logged_in']).to eq(true)
      end

      it 'returns the user details' do
        expect(json['user']['username']).to eq('Ssmith')
      end
    end
    
    context 'when there is no user logged in' do
      before { get '/api/logged_in'}

      it 'returns the message "no such user"' do
        expect(json['message']).to eq('no such user')
      end

      it 'returns logged_in as false' do
        expect(json['logged_in']).to eq(false)
      end
    end
  end

  describe 'POST /api/logout' do
    before { post '/api/login', params: { user:  { username: 'Ssmith', password: 'password1' } } }
    before { post '/api/logout'}

    it 'returns https status 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns "logged_out" as true' do
      expect(json['logged_out']).to eq(true)
    end
  end
end
