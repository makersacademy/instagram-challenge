require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  describe "POST create" do
    it "redirects to home" do
      user = User.create(email: 'example@example', password: 123456)
      user.save
      
      PicturesController.any_instance.stub(:current_user).and_return(User.first)
      PicturesController.any_instance.stub(:picture_params).and_return({"link"=>"a linke"})

      post :create, :params => {:picture => {avatar: '/uploads/123.jpg'}}
      expect(response).to have_http_status(:created)
    end
  end
end
