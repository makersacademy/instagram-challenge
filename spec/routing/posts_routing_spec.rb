require "rails_helper"

# Examples:
# describe "routing to profiles", :type => :routing do
#   it "routes /profile/:username to profile#show for username" do
#     expect(:get => "/profiles/jsmith").to route_to(
#       :controller => "profiles",
#       :action => "show",
#       :username => "jsmith"
#     )
#   end
#
#   it "does not expose a list of profiles" do
#     expect(:get => "/profiles").not_to be_routable
#   end
# end

describe "routing to posts", :type => :routing do
  it "routes get / to posts#index" do
    expect(get: "/").to route_to(
    controller: "posts",
    action: "index"
    )
  end
  it "routes get /posts to posts#index" do
    expect(get: "/posts").to route_to(
    controller: "posts",
    action: "index"
    )
  end
  it "routes post /posts to posts#create" do
    expect(post: "/posts").to route_to(
      controller: "posts",
      action: "create"
    )
  end
  it "routes get /posts/new to posts#new" do
    expect(get: "/posts/new").to route_to(
      controller: "posts",
      action: "new"
    )
  end
  it "routes get /posts/:id/edit to posts#edit" do
    expect(get: "/posts/1/edit").to route_to(
      controller: "posts",
      action: "edit",
      id: "1"
    )
  end
  it "routes get /posts/:id to posts#show" do
    expect(get: "/posts/1").to route_to(
      controller: "posts",
      action: "show",
      id: "1"
    )
  end
  it "routes post /posts/:id to posts#update" do
    expect(patch: "/posts/1").to route_to(
      controller: "posts",
      action: "update",
      id: "1"
    )
  end
  it "routes delete /posts/:id to posts#destroy" do
    expect(delete: "/posts/1").to route_to(
      controller: "posts",
      action: "destroy",
      id: "1"
    )
  end
end
