# frozen_string_literal: true

feature 'User Story 7 - Users can delete posts', type: :feature do

  scenario 'Users can delete posts' do
    log_in
    expect { click_link('Destroy', match: :first) }.to change(Post, :count).by(-1)
    expect(page).to have_content 'Post was successfully destroyed.'
  end

  scenario 'Users can only delete their own posts' do
    sign_up
    expect(page).to have_content('Posts')
    expect(page).to have_css("img[src*='test1.jpg']")
    expect(page).to have_css("img[src*='test2.jpg']")
    expect(page).to have_css("img[src*='test3.jpg']")
    expect { click_link('Destroy', match: :first) }.to_not change(Post, :count)
    expect(page).to have_content('You do not have permission to delete this post.')
  end
end
