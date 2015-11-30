require 'rails_helper'

feature 'Likes' do
  before do
    add_filterspam(email: 'user5@users.com',
                   image_name: 'feature_spec_img.png',
                   comment: 'comment 5')
    sign_up_and_sign_in(email: 'user6@users.com')
  end
  scenario 'should see like link' do
    within(:css, 'div.filterspam') do
      expect(page).to have_link('Like')
    end
  end
  scenario 'clicking should display a single like' do
    click_link 'Like'
    expect(page).to have_content "user6@users.com likes this"
  end

end
