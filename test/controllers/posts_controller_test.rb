require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  it "creates a new insta post" do
    post :create, params: { post { body: "My new insta post" } }
    expect(Post.find_by(body: "My new insta post")).to be
  end
end
