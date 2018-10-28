require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    user = double('user', id: 1)
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end


  describe "GET/new" do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { image:  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/D50_8772.jpg')), 'image/jpeg')} }
      expect(response).to redirect_to(posts_path)
    end
  end

    it "creates a post" do
      post :create, params: { post: { image:  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/D50_8772.jpg')), 'image/jpeg'), caption: "hi"} }
      expect(Post.find_by(caption: "hi")).to be
    end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end


end


# "post"=>{"message"=>"what is returned"}
# post: { message: "Hello, world!"
#
#   "post"=>{"image"=>#<ActionDispatch::Http::UploadedFile:0x00007fb69627bbf0 @tempfile=#<Tempfile:/var/folders/ds/5h94d6y17nq6dcs3r_t61z4w0000gn/T/RackMultipart20181028-12393-1wj3de5.jpg>, @original_filename="D50_8772.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"post[image]\"; filename=\"D50_8772.jpg\"\r\nContent-Type: image/jpeg\r\n">}
