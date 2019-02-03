# frozen_string_literal: true

require "rails_helper"

RSpec.describe InstaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/insta").to route_to("insta#index")
    end

    it "routes to #new" do
      expect(get: "/insta/new").to route_to("insta#new")
    end

    it "routes to #show" do
      expect(get: "/insta/1").to route_to("insta#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/insta/1/edit").to route_to("insta#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/insta").to route_to("insta#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/insta/1").to route_to("insta#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/insta/1").to route_to("insta#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/insta/1").to route_to("insta#destroy", id: "1")
    end
  end
end
