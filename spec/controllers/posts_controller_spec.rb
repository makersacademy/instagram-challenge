require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST create" do
    it "redirects to home" do
      user = User.create(email: 'example@example', password: 123456)
      user.save
      
      PostsController.any_instance.stub(:current_user).and_return(User.first)
      PostsController.any_instance.stub(:picture_params).and_return({"title"=>"a linke"})

      post :create, :params => {:post => {picture: '/uploads/123.jpg'}}
      expect(response).to have_http_status(:found)
    end
  end
end
