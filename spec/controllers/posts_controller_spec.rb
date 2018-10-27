RSpec.describe PostsController, type: :controller do
  before(:example) {}

  before (:each) do
    @user = User.create! (
      {
        username: 'testUser',
        email: 'user@test.com',
        password: 'password',
        password_confirmation: 'password'
      }
    )
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns http success status of 200 or ok' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'returns http success status of 200 or ok' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST new post' do
    it 'creates a new post' do
      post :create, params: { post: { caption: "Test Moment :)" } }
      expect(Post.all.count).to eq(1)
    end
  end

  describe 'POST delete post' do
    it 'deletes a post' do
      post :create, params: { post: { caption: "Test Moment :)" } }
      post :destroy, params: { id: Post.last.id }
      expect(Post.all.count).to eq(0)
    end
  end

  # let(:new_attributes) { { caption: 'UPDATED Test Moment!!' } }
  # describe 'PUT edit post' do
  #   context 'valid attributes' do
  #     it 'edits a post caption' do
  #       post :create, params: { post: { caption: "Test Moment :)" } }
  #       put :update, params: { id: post.id, caption: new_attributes }
  #       post.reload
  #       new_attributes.each do |key|
  #         expect(post.attributes[key.to_s]).to eq(new_attributes[key])
  #       end
  #     end
  #   end
  # end
end
