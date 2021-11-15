require "rails_helper"

RSpec.describe LikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/likes").to route_to("likes#index")
    end

    it "routes to #new" do
      expect(get: "/likes/new").to route_to("likes#new")
    end

    it "routes to #show" do
      expect(get: "/likes/1").to route_to("likes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/likes/1/edit").to route_to("likes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/likes").to route_to("likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/likes/1").to route_to("likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/likes/1").to route_to("likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/likes/1").to route_to("likes#destroy", id: "1")
    end
  end
end
