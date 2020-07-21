require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it  'should get  new ' do 
    get :new
    expect(response).to have_http_status(200)
  end 
end 


