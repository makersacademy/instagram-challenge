require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let(:photo) { create(:photo) }

  let(:valid_attributes) {
    { body: "comment body" }
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect { FactoryGirl.create(:comment) }.to change(Comment, :count).by(1)
      end

      xit "redirects to the photo index" do
        post :create, params: {comment: valid_attributes}
        expect(response).to redirect_to('/')
      end
    end
  end

end
