# require 'rails_helper'
# require_relative '../../test_helpers'

# RSpec.describe "posts/index", type: :view do
#   before(:each) do
#     User.create(username: 'username', email: 'user@user.com', password: 'pass123')
#     assign(:posts, [
#       Post.create!(
#         :description => "MyText",
#         :image =>  upload_helper,
#         :user_id => 1
#       ),
#       Post.create!(
#         :description => "MyText",
#         :image => upload_helper,
#         :user_id => 1
#       )
#     ])
#   end

#   it "renders a list of posts" do
#     render
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => "Show", :count => 2
#   end
# end
