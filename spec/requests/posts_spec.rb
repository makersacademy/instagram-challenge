require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /" do
    it 'response with 200' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'redirects to the posts url' do
      post '/posts', params: { post: { content: 'Hello', image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'Author' } }
      expect(response).to redirect_to root_path
    end

    it 'creates a post' do
      post '/posts', params: { post: { content: 'Hello5556', image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'Author' } }
      expect(Post.find_by(content: 'Hello5556')).to be 
    end
  end
end
