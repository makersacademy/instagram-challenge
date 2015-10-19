require 'rails_helper'

feature 'comments' do
  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'), caption: '#chilling')}
  let!(:user){User.create(email: 'dan@example.com',
                          password: 'Hell0World!')}
  before do
    login(user)
  end

  scenario 'allows users to leave a comment on a post using a form' do
     visit '/posts'
     click_link "#{post.id}"
     click_link 'Comment'
     find(:css, '#textarea').set "Looking Good!"
     click_button 'Create Comment'
     expect(current_path).to eq "/posts/#{post.id}"
     expect(page).to have_content('Looking Good!')
  end
end
