require 'rails_helper'
require_relative './helpers/photos_controller_helpers_spec'

RSpec.describe SessionsController, type: :controller do

    describe "GET new" do

        it "has a 200 status code" do
            get :new
            expect(response.status).to eq(200)
        end

        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
        end

    end

    describe "POST Create" do

        xit "has a 302 status code" do
            post :create, params: { user: { email: "test@email.com", 
                                    password: "password"} }
            expect(response.status).to eq(302)
        end

        xit "redirects to root" do
            create(:user)
            post :create, params: { user: { email: "test@email.com", 
                                    password: "password" } }
            expect(response).to redirect_to("/")
        end
        
        xit "assigns user" do
            user = create(:user)
            post :create, params: { user: { email: "test@email.com", 
                                    password: "password"} }
            expect(session[:user_id]).to eq(user.id)
        end

    end

end