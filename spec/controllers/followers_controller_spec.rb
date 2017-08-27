RSpec.describe FollowersController, type: :controller do
  before do
    login_user
  end

  describe "POST" do
    it "follows a user" do
      user = create(:user, email: "penfold@mouse.com")
      post :create, params: { follow: { user_id: user.id } }
      expect(response).to have_http_status(302)
      expect(user.followers.count).to eq(1)
    end
  end

  describe "DELETE" do
    it "unfollows a user" do
      user = create(:user, email: "penfold@mouse.com")
      delete :destroy, params: { id: user.username, follow: { user_id: user.id } }
      expect(response).to have_http_status(302)
      expect(user.followers.count).to eq(0)
    end
  end
end
