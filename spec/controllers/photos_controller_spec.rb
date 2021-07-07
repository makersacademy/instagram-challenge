require 'rails_helper'

RSpec.describe PhotosController, type: :controller do

  describe "Photos" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end
end
