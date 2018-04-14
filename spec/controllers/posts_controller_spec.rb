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

end
