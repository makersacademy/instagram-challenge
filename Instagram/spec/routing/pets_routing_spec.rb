require "rails_helper"

RSpec.describe PetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pets").to route_to("pets#index")
    end

    it "routes to #new" do
      expect(:get => "/pets/new").to route_to("pets#new")
    end

    it "routes to #show" do
      expect(:get => "/pets/1").to route_to("pets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pets/1/edit").to route_to("pets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pets").to route_to("pets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pets/1").to route_to("pets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pets/1").to route_to("pets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pets/1").to route_to("pets#destroy", :id => "1")
    end

  end
end
