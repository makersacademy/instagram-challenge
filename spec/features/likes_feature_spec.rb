require 'rails_helper'

feature 'likes' do
  let!(:pic) { create(:picture) }
  context 'user is signed in' do
    let!(:user) { create(:user) }
    before { sign_in_as(user) }
    scenario 'should display a link to like/unlike a picture' do
      visit '/'
      expect(page).to have_css '.like'
    end
    context 'and user did not like the pic' do
      scenario 'should display an empty heart' do
        visit '/'
        expect(page).not_to have_css '.full-like'
        expect(page).to have_css '.empty-like'
      end
    end
    context 'and user liked the pic' do
      scenario 'should display a full heart' do
        create(:like, picture: pic, user: user)
        visit '/'
        expect(page).to have_css '.full-like'
        expect(page).not_to have_css '.empty-like'
      end
    end
  end
  context 'user is not signed in' do
    scenario 'should not display any link to like/unlike a picture' do
      visit '/'
      expect(page).not_to have_css '.like'
    end
  end
  context 'showing likes' do
    scenario 'display number of likes for the picture' do
      create_list(:like, 3, picture: pic)
      visit '/'
      expect(page).to have_content '3 likes'
    end
  end
  context 'creating likes' do
    let!(:pic2) { create(:picture) }
    let!(:user) { create(:user) }
    before do
      create_list(:like, 3, picture: pic)
      sign_in_as(user)
    end
    scenario 'increment like counter of 1', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
        expect(page).to have_content '4 likes'
      end
    end
    scenario 'do not increment like counter of other pictures', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
      end
      within(:xpath, '//article[@id="' + pic2.id.to_s + '"]') do
        expect(page).to have_content '0 likes'
      end
    end
    scenario 'display a full heart', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
        expect(page).to have_css '.full-like'
      end
    end
    scenario 'do not change heart status on other pictures', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
      end
      within(:xpath, '//article[@id="' + pic2.id.to_s + '"]') do
        expect(page).to_not have_css '.full-like'
      end
    end
  end
  context 'deleting likes' do
    let!(:pic2) { create(:picture) }
    let!(:user) { create(:user) }
    before do
      create_list(:like, 5, picture: pic2)
      create_list(:like, 3, picture: pic)
      create(:like, picture: pic, user: user)
      create(:like, picture: pic2, user: user)
      sign_in_as(user)
    end
    scenario 'decrement like counter of 1', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
        expect(page).to have_content '3 likes'
      end
    end
    scenario 'do not decrement like counter of other pictures', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
      end
      within(:xpath, '//article[@id="' + pic2.id.to_s + '"]') do
        expect(page).to have_content '6 likes'
      end
    end
    scenario 'display an empty heart', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
        expect(page).to have_css '.empty-like'
      end
    end
    scenario 'do not change heart status on other pictures', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        find('.like').click
      end
      within(:xpath, '//article[@id="' + pic2.id.to_s + '"]') do
        expect(page).to_not have_css '.empty-like'
      end
    end
  end

end
