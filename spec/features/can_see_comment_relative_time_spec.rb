require_relative '../helpers/custom_feature_helper'

RSpec.feature "Experience", type: :feature do
  scenario "Can see the relative time of each comment" do
    allow_any_instance_of(PostsHelper).to receive(:calculator).and_return(1)
    sign_up
    create_post
    create_comment
    expect(page).to have_content('COMMENT Posted 1 second ago')
  end
end
