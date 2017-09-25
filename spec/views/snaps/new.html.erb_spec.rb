require 'rails_helper'
require_relative '../../support/features/clearance_helpers.rb'

RSpec.describe 'snaps/new', type: :view do
  before(:each) do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/test_image.png', 'image/png')
    @snap = assign(:snap, Snap.create!(
                            image: @file,
                            caption: 'MyText'
    ))
  end
end
