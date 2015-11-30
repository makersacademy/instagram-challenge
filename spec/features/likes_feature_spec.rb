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

  context 'multiple likes' do
    before do
      sign_out
      sign_up_and_sign_in(email: 'user7@users.com')
      click_link 'Like'
      sign_out
      sign_up_and_sign_in(email: 'user8@users.com')
      click_link 'Like'
    end
    scenario 'should be displayed in correct format' do
      likestr = "user6@users.com, user7@users.com and user8@users.com like this"
      expect(page).to have_content likestr
    end
  end
end
