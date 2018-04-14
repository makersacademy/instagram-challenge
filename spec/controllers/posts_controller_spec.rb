RSpec.describe PostsController, type: :controller do
  before(:example) { get :index }
  describe "GET #index" do
    it "returns http success status of 200 or ok" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index view" do
      expect(response).to render_template('index')
    end
  end

  describe 'POST new post' do
    it "creates a new post" do
      post :create, params: { post: { caption: "Test Moment :)" } }
      expect(Post.all.count).to eq(1)
    end
  end

end
