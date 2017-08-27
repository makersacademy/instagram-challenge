RSpec.describe CommentsController, type: :controller do
  before do
    login_user
  end

  describe "POST" do
    it "creates a comment" do
      user = create(:user, email: "colonel@mouse.com")
      photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
      post :create, params: { photo_id: photo.id,  comment: { text: "gorgeous", user_id: user.id } }
      expect(response).to have_http_status(302)
      expect(Comment.count).to eq(1)
    end
  end
end
