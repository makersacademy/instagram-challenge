

require "rails_helper"


RSpec.feature "Pictures", type: :feature do

  context "snaps are in db"  do

    before do
      visit '/'
      sign_up
      User.first.pictures.create(caption: "hashtag").save
    end

    scenario "index should display them" do
      visit '/'
      expect(page).to have_content("hashtag")
    end


  end


end
