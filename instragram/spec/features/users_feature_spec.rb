require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
  context "user needs to signup" do
    it 'should not be able to add pictures before sign up' do
    visit '/pictures'
    click_link 'Add a picture'
    expect(page).to have_content 'Log in'
    end
  end
#   context 'viewing pictures do

#   let!(:sunshine){Picture.create(name:'Sunshine')}

#   scenario 'lets a user view a profile' do
#    visit '/pictures'
#    click_link 'Eduardo'
#    expect(page).to have_content 'Sunshine'
#    expect(current_path).to eq "/restaurants/#{sunshine.id}"
#   end
# end
end