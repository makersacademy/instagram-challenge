require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created job information' do
    job_one = create(:post, caption: 'This is the first post')
    job_two = create(:post, caption: 'This is the second post')

    visit '/'
    expect(page).to have_content('This is the first post')
    expect(page).to have_content('This is the second post')
    expect(page).to have_css("img[src*='scenery']")
  end

  scenario 'the images in the index link to each individual show page' do
    post = create(:post, caption: 'This is image number 1')

    visit '/'
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'This is image number 1'
    expect(page.current_path).to eq(post_path(post))
  end
end
