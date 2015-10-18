require 'rails_helper'

feature 'comments' do
  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'), caption: '#chilling')}

  scenario 'allows users to leave a comment on a post using a form' do
     visit '/posts'
     click_link "#{post.id}"
     click_link 'Comment'
     fill_in 'Comments', with: 'Looking Good!'
     click_button 'Create Comment'
     expect(current_path).to eq "/posts/#{post.id}"
     expect(page).to have_content('Looking Good!')
  end
end
