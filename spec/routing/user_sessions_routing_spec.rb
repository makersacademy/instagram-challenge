require "rails_helper"

RSpec.describe UserSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_sessions").to route_to("user_sessions#index")
    end

    it "routes to #new" do
      expect(get: "/user_sessions/new").to route_to("user_sessions#new")
    end

    it "routes to #show" do
      expect(get: "/user_sessions/1").to route_to("user_sessions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_sessions/1/edit").to route_to("user_sessions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_sessions").to route_to("user_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_sessions/1").to route_to("user_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_sessions/1").to route_to("user_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_sessions/1").to route_to("user_sessions#destroy", id: "1")
    end
  end
end
