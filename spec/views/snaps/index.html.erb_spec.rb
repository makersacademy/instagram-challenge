require 'rails_helper'
# require "support/features/clearance_helpers"
# require 'helper_methods.rb'

RSpec.describe 'snaps/index', type: :view do
  before(:each) do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/test_image.png', 'image/png')
    assign(:snaps, [
             Snap.create!(
               image: @file,
               caption: 'MyText'
             ),
             Snap.create!(
               image: @file,
               caption: 'MyText'
             )
           ])
  end

  # it "renders a list of snaps" do
  #   render
  #   assert_select "tr>td", :text => "Image".to_s, :count => 2
  #   assert_select "tr>td", :text => "MyText".to_s, :count => 2
  # end
end
