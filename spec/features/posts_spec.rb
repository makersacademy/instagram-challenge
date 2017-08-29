require 'rails_helper'

feature 'Posts' do
  let!(:test_description) { 'I can haz rails?' }
  let!(:user) { create :user }

  before do
    log_in
  end

  scenario 'Can be created' do
    visit '/'
    click_link 'New'
    fill_in 'Description', with: test_description
    attach_file 'post_image', "#{Rails.root}/spec/support/fixtures/test_image.png"
    click_button 'Create post'
    expect(page).to have_content(test_description)
  end

end
