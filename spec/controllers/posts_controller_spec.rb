require "rails_helper"
require "spec_helper"

RSpec.describe PostsController, type: :controller do
  before(:each) do
    user = create(:user)
    sign_in user
  end
  
  it "creates a new insta post" do
    post :create, params: { post: { body: "My new insta post" } }
    expect(Post.find_by(body: "My new insta post")).to be
  end
end
