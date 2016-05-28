require 'rails_helper'

feature 'User can view a list of posts' do  
  scenario 'the index displays previously created posts' do
    job_one = create(:post, caption: "This is a post")
    job_two = create(:post, caption: "This is another post")
    visit '/'
    expect(page).to have_content("This is a post")
    expect(page).to have_content("This is another post")
    expect(page).to have_css("img[src*='burger']")
  end
end