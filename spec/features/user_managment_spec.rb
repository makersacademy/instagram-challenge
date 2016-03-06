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
      expect(page).to have_content "user.me"
      expect(page).to have_content "Log out"
    end   
   
   scenario 'can click on a link to use facebook to sign up' do
     visit '/'
     expect(page).to have_content "Sign in with Facebook"
  end
 end
end