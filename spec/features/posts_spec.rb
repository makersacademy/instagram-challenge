require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "A user can submit a post with a picture and description" do
    make_a_post
    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)
    #Add expectation for the picture
    expect(page).to have_content('Hummingbirds take a bath')
  end
end

def make_a_post(picture: './spec/images/humming_birds.png',
                description: 'Hummingbirds take a bath')
  visit "/posts/new"
  attach_file 'Picture', picture
  fill_in "Description", with: description
  click_button 'Save Post'
end
