RSpec.describe PhotosController, type: :controller do
  before do
    login_user
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "successfull routes to an individual photo page" do
      photo = create(:photo, user: User.first)
      get :show, params: { id: photo.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "successfully routes to an individual photo's edit page" do
      photo = create(:photo, user: User.first)
      get :edit, params: { id: photo.id }
      expect(response).to have_http_status(:success)
    end

    it "redirects the user if they do not own the phpto" do
      photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
      expect(get :edit, params: { id: photo.id }).to redirect_to root_path
    end
  end

  describe "POST" do
    it "allows a photo to be uploaded" do
      post :create, params: { photo: { description: "Emily", image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png') } }
      expect(response).to have_http_status(302)
      expect(Photo.count).to eq(1)
    end
  end

  describe "PATCH" do
    it "allows a photo to be edited" do
      photo = create(:photo, user: User.first)
      post :update, params: { id: photo.id, photo: { description: "Emily, but better" } }
      expect(response).to have_http_status(302)
      expect(Photo.last.description).to eq("Emily, but better")
    end

    it "does not allow an update unless the user owns the photo" do
      photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
      expect(post :update, params: { id: photo.id, photo: { description: "Emily, but better" } }).to redirect_to root_path
    end
  end

  describe "DELETE" do
    it "deletes the photo" do
      photo = create(:photo, user: User.first)
      delete :destroy, params: { id: photo.id }
      expect(response).to have_http_status(302)
      expect(Photo.count).to eq(0)
    end

    it "only deletes the photo if it belongs to the current user" do
      photo = create(:photo, user: create(:user, email: "penfold@mouse.com"))
      delete :destroy, params: { id: photo.id }
      expect(Photo.count).to eq(1)
    end
  end
end
