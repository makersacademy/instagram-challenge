require 'rails_helper'
require 'features_helper'

feature 'Navigation' do

  scenario 'can click the link to see the posts page' do
    sign_up_for_an_account
    post_an_image
    click_link 'Post detail'
    click_link 'Posts'
    expect(page.current_path).to eq '/posts'
  end
  
end