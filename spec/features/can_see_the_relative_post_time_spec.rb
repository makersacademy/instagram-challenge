require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Can see the relative time when each post was posted" do
    allow_any_instance_of(Post).to receive(:created_at).and_return('2018-04-27 14:05:06.724401000 +0000')
    allow_any_instance_of(PostsHelper).to receive(:get_time).with('2018-04-27 14:05:06.724401000 +0000').and_return('1 min ago')
    sign_up
    create_post
    expect(page).to have_content('1 min ago')
  end
end
