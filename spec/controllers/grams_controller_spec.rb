require 'rails_helper'

RSpec.describe GramsController, type: :controller do
  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "Get /grams/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "Post /grams" do
    it "redirects to the home page" do
      user = User.create(username: "test", password: "1234")
      post :create, params: { gram: { body: "This is my first post.", image: fixture_file_upload('./spec/fixtures/dinosaur1.jpeg'), user_id: user.id } }
      expect(response).to redirect_to(root_path)
    end

    it "creates a gram" do
      user = User.create(username: "test", password: "1234")
      post :create, params: { gram: { body: "This is my first post.", image: fixture_file_upload('./spec/fixtures/dinosaur1.jpeg'), user_id: user.id } }
      expect(Gram.find_by(body: "This is my first post.")).to be
    end
  end
end


# IMAGE_ROUTE =  "#<ActionDispatch::Http::UploadedFile:0x00007fb0e8830e28 @tempfile=#<Tempfile:/var/folders/r4/z4pwqljs2dgcvrqf333cl1q80000gn/T/RackMultipart20210425-12752-pe5tri.jpeg>, @original_filename='dinosaur1.jpeg', @content_type='image/jpeg', @headers='Content-Disposition: form-data; name=\"gram[image]\"; filename=\"dinosaur1.jpeg\"\r\nContent-Type: image/jpeg\r\n'>"
