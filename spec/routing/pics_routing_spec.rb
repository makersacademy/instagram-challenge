require "rails_helper"

RSpec.describe PicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/pics").to route_to("pics#index")
    end

    it "routes to #new" do
      expect(:get => "/pics/new").to route_to("pics#new")
    end

    it "routes to #show" do
      expect(:get => "/pics/1").to route_to("pics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pics/1/edit").to route_to("pics#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pics").to route_to("pics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pics/1").to route_to("pics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pics/1").to route_to("pics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pics/1").to route_to("pics#destroy", :id => "1")
    end
  end
end
