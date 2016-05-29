require 'rails_helper'

feature 'comments' do
  image = File.new(File.expand_path('./spec/features/test.png'))
  before {Post.create(title:'TEST', image:image, tag:'tagged')}
    scenario 'users can comment on posts and add reactions' do
      visit '/posts'
      click_link 'Comment on TEST'
      fill_in "Message", with: "first comment"
      select('lol', from: 'Reaction')
      click_button 'Add Comment'
      expect(current_path).to eq('/posts')
      expect(page).to have_content("first comment")
      expect(page).to have_content("lol")
    end
end
