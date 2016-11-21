require 'spec_helper'

feature 'posting images' do

  before  do
    Image.create(:title => 'test', :image => 'spec/test_img/test.jpg')
  end

  scenario 'user can comment on an image' do
    sign_up
    visit '/'
    click_link 'Timstigrams'
    click_link 'Add comment'
    fill_in 'comment_contents', :with => 'testcomment'
    click_button 'Submit'
    expect(page).to have_content 'testcomment'
  end

end
