RSpec.describe ProfilesController, type: :controller do
  describe "GET #show" do
    it "routes to an individual user's profile" do
      user = create(:user)
      get :show, params: { id: user.username }
      expect(response).to have_http_status(:success)
    end
  end
end
