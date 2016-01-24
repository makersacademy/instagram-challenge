require "rails_helper"

RSpec.feature "hipstergrams" do

  before {
    sign_up
    sign_in }
  
  context "When no hipstergrams have been added" do

    scenario "It should display a prompt to upload an hipstergram" do
      expect(page).to have_content "You got here before it was cool; no hipstergrams have been added"
      expect(page).to have_link "Upload new hipstergram"
    end
  end


  context "When an hipstergram has been added" do
    
    scenario "An hipster can upload an hipstergram" do
        visit '/hipstergrams'
        click_link 'Pick a photogram'
        attach_file :post_image, './spec/images/test.jpg'
        fill_in 'Description', with: 'Cold brew triple distilled mason water coffee'
        click_button 'Share your art'

        expect(page).to have_css 'img[src*=\'test.jpg\']'
        expect(page).to have_content 'Cold brew'
    end
    
  end




end
