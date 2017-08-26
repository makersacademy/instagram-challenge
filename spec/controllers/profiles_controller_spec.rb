require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "GET /show" do
    it "routes /profiles/1 to profiles#show" do
      expect(get: "/profiles/1").to route_to(
      controller: "profiles",
      action: "show",
      id: "1"
      )
    end
  end
end
