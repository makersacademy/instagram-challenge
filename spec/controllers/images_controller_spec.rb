# require 'rails_helper'
#
# RSpec.describe ImagesController, type: :controller do
#   let!(:disneyland) { Image.create(title: "Disneyland") }
#
#   describe "GET /" do
#     it "responds with HTTP 200" do
#       get :index
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe "GET /new" do
#     it "responds with 200" do
#       get :new
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe "POST /" do
#     let!(:party) { post :create, params: { restaurant: { title: "Byron" } } }
#
#     it "Redirects to /images" do
#       expect(response).to redirect_to(images_path)
#     end
#
#     it "Creates a new image" do
#       expect(Image.find_by(title: "Byron")).to be
#     end
#   end
#
#   describe "GET /:id" do
#     it "responds with 200" do
#       get :show, params: { id: party.id }
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe "GET /edit" do
#     it "responds with 200" do
#       get :edit, params: { id: party.id }
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe "PUT /update" do
#     before { put :update, params: { id: party.id, image: { title: "Party" } } }
#
#     it "Redirects to /images" do
#       expect(response).to redirect_to(images_path)
#     end
#
#     it "Updates an image upload" do
#       expect(Image.find_by(title: "Drunk off my face")).to be
#     end
#   end
# end
