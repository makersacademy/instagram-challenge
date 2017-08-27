RSpec.describe LikesController, type: :controller do
  before do
    login_user
  end

  describe "POST" do
    it "creates a like" do
      photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
      post :create, params: { photo_id: photo.id }
      expect(response).to have_http_status(302)
      expect(Like.count).to eq(1)
    end
  end
end
