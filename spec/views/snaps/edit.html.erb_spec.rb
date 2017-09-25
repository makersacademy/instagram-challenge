require 'rails_helper'
require 'launchy'
require 'support/features/clearance_helpers'

RSpec.describe 'snaps/edit', type: :view do
  before(:each) do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/test_image.png', 'image/png')
    @snap = assign(:snap, Snap.create!(
                            image: @file,
                            caption: 'MyText'
    ))
  end
end
