require 'rails_helper'

describe "Pictures" do
  context "no pictures have been added" do
    it 'should confirm none have been added' do
      visit '/pictures'
      expect(page).to have_content "No pictures have been added"
      expect(page).to have_link "Add a picture"
    end
  end

  context "pictures have been added" do
    before do
      Picture.create!(caption: "My first picture")
    end
    it "should display pictures" do
      visit '/pictures'
      expect(page).to have_content "My first picture"
      expect(page).not_to have_content "No pictures have been added"
    end
  end
end
