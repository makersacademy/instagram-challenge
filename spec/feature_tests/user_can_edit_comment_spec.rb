RSpec.describe "Editing comments", :type => :feature do

  before do
    @post = create(:post)
    user = User.create email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

  feature 'editing a comment added to post' do
    scenario 'user deletes comment' do
      add_comment('My cool cat')
      expect(page).to have_content "My cool cat"
      click_link 'Delete Comment'
      expect(page).to_not have_content("My cool cat")
    end
  end
end
