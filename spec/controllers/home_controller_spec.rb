require 'rails_helper'

# RSpec.describe RoutesController, type: :controller do

# end

RSpec.describe "/" do
    it "responds with 200" do
        get :index
        expect(response).to have_http_status(200)
    end
end
