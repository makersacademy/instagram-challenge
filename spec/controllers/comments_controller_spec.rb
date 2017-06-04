require 'rails_helper'

RSpec.describe CommentsController do
  describe "POST create" do
    it "creates a comment" do
      user = User.create(email: "test@email.com", password: "123456")
      image = Image.create(user_id: user.id, title: "My shot", description: "My very first shot")
      post :create, params: { comment: {body: "This is a comment", user_id: user.id, image_id: image.id}}
      expect(response).to redirect_to images_path
      expect(Comment.last.user).to eq(user)
      expect(Comment.last.image).to eq(image)
    end
  end
end
