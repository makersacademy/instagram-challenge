require 'rails_helper'

feature "User can like pics" do

  context "User logged in" do
    before do
      sign_up
      upload_pic
    end

    it "can like pic", js: true do
      expect(page.find('div').find('.like-div')[:class].include?("unclicked")).to eq(true)
      click_link "Like"
      expect(page).to have_content("1 like")
      expect(page.find('div').find('.like-div')[:class].include?("clicked")).to eq(true)
    end

    xit 'several users can click Like, which increments the Like count', js: true do
    end

    xit 'when user click 2 times the like button, he will unlike the pic', js: true do
      sign_up
      upload_pic
      expect(page.find('div').find('.like-div')[:class].include?("unclicked")).to eq(true)
      click_link "Like"
      expect(page.find('div').find('.like-div')[:class].include?("clicked")).to eq(true)
      click_link "Like"
      expect(page.find('div').find('.like-div')[:class].include?("unclicked")).to eq(true)
    end

  end
end
