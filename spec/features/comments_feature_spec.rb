require 'rails_helper'

feature 'commenting' do

    photo = File.new(Rails.root + 'spec/fixtures/test.png')

    before do
      Post.create(image: photo, caption: 'My first post')
    end

  scenario 'allows mums to comment on each others photos' do
    visit '/posts'
    click_link 'comment'
    fill_in 'Thoughts', with: 'Hmm, he is a bit spotty :-/'
    click_button 'post comment'
    expect(page).to have_content 'Hmm, he is a bit spotty :-/'
  end
end
