require "rails_helper"

RSpec.feature "hipstergrams" do

  before { sign_in(sign_up) }
  
  context "When no hipstergrams have been added" do

    scenario "It should display a prompt to upload an hipstergram" do
      visit "/hipstergrams"
      expect(page).to have_content "You got here before it was cool; no hipstergrams have been added"
      expect(page).to have_link "Upload new hipstergram"
    end
  end


  context "When an hipstergram has been added" do
    
    scenario "An hipster can upload an hipstergram" do
        visit '/posts'
        click_link 'Pick a photogram'
        attach_file :post_image, './spec/images/test.jpg'
        fill_in 'Description', with: 'Cold brew triple distilled mason water coffee'
        click_button 'Share your art'

        expect(page).to have_css 'img[src*=\'cat.png\']'
        expect(page).to have_content 'A random cat'
    end
    
  end




end
