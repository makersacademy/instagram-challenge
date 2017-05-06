require 'rails_helper'

feature 'commenting' do
  before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png"), user: User.new }

  scenario 'allows users to comment using form' do
    visit posts_path
    sign_up('tiddles@cat.com')
    leave_comment('Lovely')
    expect(current_path).to eq posts_path
    expect(page).to have_content('Lovely')
  end
end

feature 'comments' do
  scenario 'user can comment on their own post' do
    visit posts_path
    sign_up('tiddles@cat.com')
    create_post
    leave_comment('Lovely')
    expect(page).to have_content('Lovely')
  end

  scenario 'user can leave multiple comments on one post' do
    visit posts_path
    sign_up('tiddles@cat.com')
    create_post
    leave_comment('So Pretty')
    leave_comment('Beautiful')
    expect(page).to have_content('So Pretty')
    expect(page).to have_content('Beautiful')
  end
end
