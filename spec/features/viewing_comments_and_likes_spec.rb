feature 'Viewing likes and comments', js: true do
  scenario 'Click like and likes appear on the page' do
    create(:photo)
    visit '/photos'
    click_button('Like')
    expect(page).to have_content('1')
  end
  scenario 'Submit comment and comment appears on the page' do
    create(:photo)
    visit '/photos'
    fill_in('text', with: 'Super cool picture')
    click_button('Add Comment')
    expect(page).to have_content('Super cool picture')
  end
end
