feature 'User managment:' do
  
  context 'is not logged in' do
    
    scenario 'when visiting homepage can see log in form and sign up buttons' do
        visit '/'
        expect(page).to have_content "Log in"
        expect(page).to have_link "Sign up"
    end
  
    scenario 'when visiting homepage cannot see a log out link' do
      visit '/'
      expect(page).not_to have_content "Log out"
    end
  end
    
  context 'is signed up and logged in' do
    
    scenario 'can see the username and log out link displayed' do
      sign_up
      expect(page).to have_content "user.second"
      expect(page).to have_content "Log out"
    end   
   
    scenario 'can click on a link to use facebook to sign up' do
      visit '/'
      expect(page).to have_content "Sign in with Facebook"
    end
     
    scenario 'can access the account page and see the picture posted' do
      sign_up
      post_picture
      click_link 'user.second'
      expect(page.status_code).to eq 200
      expect(page).to have_selector "img"
    end
    
    scenario 'cannot delete pictures posted by other users' do
      sign_up('test2@ymail.com', 'user.third')
      click_link 'user.third'
      expect(page).not_to have_selector "img"
    end
    
 end
end