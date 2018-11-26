# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe CommentsController, type: :controller do
#   describe "::create" do
#     let (:post_user) { FactoryBot.create(:user) }
#     let (:comment_user) { FactoryBot.create(:user) }
#     # let(:photo_dir) { "files/uploads/capybara.jpg" }
#     # let(:photo_full_dir) { Rails.root.join("spec", "fixtures", photo_dir) }
#     # let(:photo) { fixture_file_upload(photo_dir, 'image/jpeg') }
#     let (:comment_message) { "This is a test comment" }
#     let (:post) { FactoryBot.create(:post, user: :post_user) }
#     context "authenicated user" do
#       before(:each) do
#         sign_in comment_user
#         post :create, params: { comment: { message: comment_message } }
#       end
#       it "adds a post to the database with correct photo" do
#         expect(Comment.last.message).to eq comment_message
#       end
#       it "should redirect to posts#index" do
#         expect(response).to redirect_to '/posts'
#       end
#     end
#     context "unauthenicated user" do
#       it "should redirect to login" do
#         post :create
#         expect(response).to redirect_to '/users/sign_in'
#       end
#     end
#   end
# end
