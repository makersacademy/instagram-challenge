require 'rails_helper'

feature "like posts" do
  scenario "can like a post" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    visit '/'
    click_on "Like"
    within ".likes" do
      expect(page).to have_content('1')
    end
  end

  scenario "can unlike a post once you've liked it" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    visit '/'
    click_on "Like"
    click_on "Unlike"
    within ".likes" do
      expect(page).to have_content('0')
    end
  end
end
