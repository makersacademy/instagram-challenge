require 'rails_helper'

describe PostsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

# RSpec.describe PostsController, :type => :controller do
#   describe "GET #index" do
#
#
#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end
#
#     it "loads all of the posts into @posts" do
#       post1, post2 = Post.create!, Post.create!
#       get :index
#
#       expect(assigns(:posts)).to match_array([post1, post2])
#     end
#   end
# end
