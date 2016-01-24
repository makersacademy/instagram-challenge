require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'No posts yet!'
      expect(page).to have_link 'New Post'
    end
  end
end

feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/maccabees.jpg")
    fill_in 'Caption', with: 'great gig last night'
    click_button 'Create Post'
    expect(page).to have_content('great gig last night')
    expect(page).to have_css("img[src*='maccabees.jpg']")
  end
  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "The pen is mightier than the sword"
    click_button 'Create Post'
    expect(page).to have_content('Stop, in the name of love! You need to upload an image')
  end
end

feature 'Index displays a list of posts' do
  before do
    job_one = create(:post, caption: "This is post one")
    job_two = create(:post, caption: "This is the second post")
  end
  scenario 'the index displays correct created job information' do

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='maccabees']")
  end
end

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/maccabees.jpg")
    fill_in 'Caption', with: 'great gig last night'
    click_button 'Create Post'
    visit '/posts/2'
    expect(page).to have_content('great gig last night')
  end
end
