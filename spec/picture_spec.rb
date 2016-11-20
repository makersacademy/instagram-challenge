require 'rails_helper'

RSpec.feature 'Picture' do
  before (:each) do
  end

scenario 'can add an image', :focus => true do
  sign_up
  add_new_picture
  p body
  expect(current_path).to eq '/pictures'
  expect(page).to have_css("img[src*='fallingwater']")
end

scenario 'can add caption', :focus => true do
  sign_up
  add_new_picture
  expect(page).to have_content("Gorgeous place")
end

scenario 'can have comments' do
  sign_up
  find("a:contains['']")
  #  click on image/id
  # fill_in comments with some comments
  # click_button "Post Comments"
  # click on image/id
  # expect(page) to have content "some comments"
end

scenario 'can have likes' do
  # click on image/id
  # click_button 'Like'
  #  model test - expect model.quantity to change by 1
  # feature test - expect(page).to have content "2 likes"
end




end
