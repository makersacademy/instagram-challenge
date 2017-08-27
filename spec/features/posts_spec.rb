require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "A user can submit a post with a picture and description" do
    make_a_post
    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)
    expect(page).to have_css 'img.posts-index-picture'
    expect(page).to have_content('Humming birds taking a bath')
  end

  scenario "Posts are displayed in reverse chronological order" do
    make_a_post
    make_a_post(picture: Rails.root.join('spec/images/lena_river_siberia.png'),
                description: 'Endlessly reflecting the sky in its stillness')
    make_a_post(picture: Rails.root.join('spec/images/greenland.png'),
                description: 'Painted skies under an Arctic sunset')
    expect(page.all('.posts-index-description')[0])
      .to have_content('Painted skies under an Arctic sunset')
  end
end

def make_a_post(picture: Rails.root.join('spec/images/humming_birds.png'),
                description: 'Humming birds taking a bath')
  visit "/posts/new"
  attach_file 'Picture', picture
  fill_in "Description", with: description
  click_button 'Save Post'
end
