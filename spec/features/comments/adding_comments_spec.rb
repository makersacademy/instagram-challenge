require 'rails_helper.rb'

feature 'Adding comments' do

  let(:user) { create(:user) }
  
  before do
    login_as(user, :scope => :user)
    new_post = create(:post, caption: "I'm gonna eat this burrito!", user_id: user.id)
  end

  scenario 'adding a comment to a post' do
    visit '/posts/1'
    fill_in 'comment_text', with: "Holy shit, that looks delicious!"
    click_button 'save'
    expect(page).to have_content "Holy shit, that looks delicious!"
  end

end
