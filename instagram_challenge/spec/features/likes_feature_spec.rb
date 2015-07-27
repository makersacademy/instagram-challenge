require 'rails_helper'

feature 'liking photos' do

  # before do
  #   photo = Photo.create(title: 'mountains', caption: 'we be caption')
  #   photo.comments.create(comment: 'great view!')
  # end
  #
  # scenario 'a '
end




def sign_up
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'
    end
