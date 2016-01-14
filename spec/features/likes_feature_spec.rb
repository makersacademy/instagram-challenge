require 'rails_helper'

feature 'Likes' do
  before do
    add_filterspam(email: 'user5@users.com',
                   username: 'user5',
                   image_name: 'feature_spec_img.png',
                   comment: 'comment 5')
    sign_up_and_sign_in(email: 'user6@users.com', username: 'user6')
  end
  scenario 'should see like link' do
    within(:css, 'div.filterspam') do
      expect(page).to have_link('Like')
    end
  end
  scenario 'clicking should display a single like' do
    click_link 'Like'
    expect(page).to have_content "user6 likes this"
  end

  context 'multiple likes' do
    before do
      click_link 'Like'
      sign_out
      sign_up_and_sign_in(email: 'user7@users.com', username: 'user7')
      click_link 'Like'
      sign_out
      sign_up_and_sign_in(email: 'user8@users.com', username: 'user8')
      click_link 'Like'
    end
    scenario 'should be displayed in correct format' do
      likestr = "user6, user7 and user8 like this"
      expect(page).to have_content likestr
    end
  end
end
