feature 'comments' do
  context 'adding comments' do
    scenario 'logged in users can see comment option' do
      image = create :image
      user = build :user
      sign_in(user)
      visit root_path
      find("a.image#{image.id}").click
      expect(page).to have_css 'input'
    end

    scenario 'logged in users can comment', js: true do
      image = create :image
      user = build :user
      sign_in(user)
      visit root_path
      save_and_open_page
      find("a.image#{image.id}").click
      fill_in 'comment', with: 'Wow'
      click_button 'Submit'
      expect(page).to have_content 'Wow'
    end
  end
end
