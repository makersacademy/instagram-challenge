# require 'rails_helper'
#
# RSpec.describe "posts/index", type: :view do
#   before(:each) do
#     assign(:posts, [
#       Post.create!(
#         :caption => "MyText",
#         :image => "Image",
#         :user => nil
#       ),
#       Post.create!(
#         :caption => "MyText",
#         :image => "Image",
#         :user => nil
#       )
#     ])
#   end
#
#   it "renders a list of posts" do
#     render
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#     assert_select "tr>td", :text => "Image".to_s, :count => 2
#     assert_select "tr>td", :text => nil.to_s, :count => 2
#   end
# end
