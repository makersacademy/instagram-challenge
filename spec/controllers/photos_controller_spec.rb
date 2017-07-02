require 'rails_helper'
require_relative './helpers/photos_controller_helpers_spec'

RSpec.describe PhotosController, type: :controller do
    
    before(:each) do
        @user = create(:user)
        @user.photos.create({title: "New Photo", image_file: upload_file  })
        session[:user_id] = @user.id
    end

    describe "GET index" do

        it "has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
        
        it "assigns @photos" do
            get :index
            expect(assigns(:photos)).to eq([@user.photos[0]])
        end
    end

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

    describe "GET show" do

        it "has a 200 status code" do
            get :show, params: { id: @user.photos[0].id }
            expect(response.status).to eq(200)
        end

        it "renders the show template" do
            get :show, params: { id: @user.photos[0].id }
            expect(response).to render_template("show")
        end
        
        it "assigns @photo" do
            get :show, params: { id: @user.photos[0].id }
            expect(assigns(:photo)).to eq(@user.photos[0])
        end

    end

    describe "POST Create" do

        it "has a 302 status code" do
            post :create, params: { photo: {title: "New Photo", image_file: upload_file  } }
            expect(response.status).to eq(302)
        end

        it "redirects to show" do
            post :create, params: { photo: {title: "New Photo", image_file: upload_file  } }
            expect(response).to redirect_to("/photos/#{most_recent_photo.id}")
        end
        
        it "assigns @photo" do
            post :create, params: { photo: {title: "New Photo", image_file: upload_file  } }
            expect(assigns(:photo)).to eq(most_recent_photo)
        end

    end

end
