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
    describe "GET /show" do
      it "routes /photos/1 to photos#show" do
        expect(get: "/photos/1").to route_to(
        controller: "photos",
        action: "show",
        id: "1"
        )
      end
    end
  end

  describe "POST" do
    it "allows a photo to be uploaded" do
      post :create, params: { photo: { description: "Emily", image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png') } }
      expect(response).to have_http_status(302)
      expect(Photo.count).to eq(1)
    end
  end
end
