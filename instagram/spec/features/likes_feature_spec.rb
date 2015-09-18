require 'rails_helper'

feature "liking photos" do 
    # {user = User.create}
    # {user.Photo.create description: "Fujisan"}
  
  let (:user) {User.create(email: "test@test.com", 
                          password: "password123", 
                          password_confirmation: "password123"
                                )}

  before {Photo.create description: 'Fujisan', user: user}


  scenario "each photo starts with 0 likes" do
     visit "/photos"
     expect(page).to have_content("0 Likes")
     expect(page).not_to have_content("1 likes")
  end


  context "when user is signed in" do

    before :each do
      sign_in_user_1
    end
  	
    scenario "can like a photo, and update like counter" do
  		visit "/photos"
      save_and_open_page
  		click_button "likeButton"
  		expect(page).to have_content "1 Likes"
  		expect(page).not_to have_content "0 likes"
  	end
  end

  context "when user is NOT signed in" do
		scenario "cannot like a photo, counter does not update" do
			visit "/photos"
			expect(page).to have_content "0 Likes"
			expect(page).not_to have_content "1 likes"
			expect(page).to have_content "Sign in"
		end
  end

  private 

  def sign_in_user_1
    visit ("/")
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end