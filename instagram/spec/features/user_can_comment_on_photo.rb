require './spec/rails_helper'

RSpec.feature 'Comments', type: :feature do

  scenario 'Users can comment on one anothers photos', :type => :feature do
    sign_up
    upload_photo
    fill_in 'comment_content', with: 'An example of a comment'
    click_button 'Create Comment'
    expect(page).to have_content('An example of a comment')
  end

end
