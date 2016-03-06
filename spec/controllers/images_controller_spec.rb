require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  
  before do
    allow_expectations_on_nil = true
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.code).to eq "200"
  end
 end
   it "renders '/images' template" do
     get :index
     expect(response).to render_template({layout: ['/images/index', 'layouts/application']}) 
 end
end
