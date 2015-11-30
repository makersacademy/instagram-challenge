require 'rails_helper'

feature 'Comments' do
  before do
    add_filterspam(email: 'user9@users.com',
                   username: 'user9',
                   image_name: 'feature_spec_img.png',
                   comment: 'comment 9')
    sign_up_and_sign_in(email: 'user4@users.com', username: 'user4')
  end
  scenario 'should see comment link' do
    within(:css, 'div.filterspam') do
      expect(page).to have_link('Comment')
    end
  end
  scenario 'clicking should take user to form, then display the comment' do
    add_comment(comment: 'comment 4')
    within(:css, 'div.filterspam') do
      expect(page).to have_content('comment 4')
    end
  end


end
