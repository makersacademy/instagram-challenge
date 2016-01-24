require 'rails_helper'

feature 'comments' do
  let!(:pic) { create(:picture) }
  context 'user is signed in' do
    before { sign_in_as(create(:user)) }
    scenario 'should display an input to add a comment' do
      visit '/'
      expect(page).to have_css 'input#comment_content'
    end
  end
  context 'user is not signed in' do
    scenario 'should not display any input to add a comment' do
      visit '/'
      expect(page).not_to have_css 'input#comment_content'
    end
  end
  context 'showing comments' do
    let!(:pic2) { create(:picture) }
    let!(:comment)  { create(:comment, picture: pic) }
    let!(:comment2) { create(:comment, picture: pic2) }
    scenario 'show comments below relative picture', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        expect(page).to have_content comment.content
      end
      within(:xpath, '//article[@id="' + pic2.id.to_s + '"]') do
        expect(page).to have_content comment2.content
      end
    end
  end
  context 'creating comments' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    before { sign_in_as(user1) }
    scenario 'allows user to leave a picture comment using a form', js: true do
      visit '/'
      fill_in 'comment[content]', with: 'a comment'
      find('input#comment_content').native.send_keys(:return)
      expect(page).to have_content 'a comment'
    end
    scenario 'does not allow user to leave empty picture comment', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        list = find('ul.comments').all('li')
        size = list.size
        fill_in 'comment[content]', with: ''
        find('input#comment_content').native.send_keys(:return)
        expect(page).to have_css('li', count: size)
      end
    end
    scenario 'allow user to add multiple comments', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        list = find('ul.comments').all('li')
        size = list.size
        fill_in 'comment[content]', with: 'first comment'
        find('input#comment_content').native.send_keys(:return)
        wait_for_ajax
        fill_in 'comment[content]', with: 'second comment'
        find('input#comment_content').native.send_keys(:return)
        expect(page).to have_content 'first comment'
        expect(page).to have_content 'second comment'
        expect(page).to have_css('li', count: size + 2)
      end
    end
    scenario 'allow different users to add comments', js: true do
      visit '/'
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        fill_in 'comment[content]', with: 'first comment'
        find('input#comment_content').native.send_keys(:return)
        wait_for_ajax
      end
      sign_out
      sign_in_as(user2)
      within(:xpath, '//article[@id="' + pic.id.to_s + '"]') do
        fill_in 'comment[content]', with: 'second comment'
        find('input#comment_content').native.send_keys(:return)
        expect(page).to have_content user1.username + ' first comment'
        expect(page).to have_content user2.username + ' second comment'
      end
    end
  end
  #   scenario 'do not allow users to leave more than one review per restaurant' do
  #     user       = create(:user)
  #     restaurant = create(:restaurant, name: 'KFC', user: user)
  #     create(:review, restaurant: restaurant, user: user)
  #     sign_in_as(user)
  #     visit '/restaurants'
  #     click_link 'Review KFC'
  #     fill_in "Thoughts", with: "so so"
  #     select '3', from: 'Rating'
  #     click_button 'Leave Review'
  #     expect(page).to have_content('error')
  #   end
  # end
  # context 'deleting reviews' do
  #   scenario 'removes a review when a user clicks a delete link' do
  #     user       = create(:user)
  #     restaurant = create(:restaurant, name: 'KFC', user: user)
  #     create(:review, thoughts: 'so so', restaurant: restaurant, user: user)
  #     sign_in_as(user)
  #     visit '/restaurants'
  #     click_link 'KFC'
  #     click_link 'Delete review'
  #     expect(page).not_to have_content 'so so'
  #     expect(page).to have_content 'Review deleted successfully'
  #   end
  #   scenario 'throws an error if trying to delete a review I did not author' do
  #     user = create(:user)
  #     restaurant = create(:restaurant, name: 'KFC', user: user)
  #     create(:review, restaurant: restaurant, user: user)
  #     new_user = create(:user, email: 'newuser@email.com')
  #     sign_in_as(new_user)
  #     visit '/restaurants'
  #     click_link 'KFC'
  #     click_link 'Delete review'
  #     expect(page).to have_content 'error'
  #   end
  # end
  #
  # scenario 'displays an average rating for all reviews' do
  #   user = create(:user)
  #   user2 = create(:user, email: 'email@email.com')
  #   restaurant = create(:restaurant, user: user)
  #   create(:review, rating: 3, restaurant: restaurant, user: user)
  #   create(:review, rating: 5, restaurant: restaurant, user: user2)
  #   visit '/restaurants'
  #   expect(page).to have_content('★★★★☆')
end
