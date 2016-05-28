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

feature 'User can view an individual post' do 
  scenario 'the user can navigate to an individual post' do 
    post = create(:post, caption: "I like tacos")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
    expect(page).to have_content("I like tacos")
  end
end