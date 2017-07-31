require 'rails_helper'

feature 'user can add a post' do
  before do
    visit "/"
    click_link "Sign up"
    sign_up
    click_link('Add a post')
  end

  scenario 'fills in all fields' do
    expect { add_post }.to change { Post.count }.by(1)
    expect(current_path).to eq("/users/1")
  end

  scenario 'leaves title empty' do
    expect { add_post(post_title: '') }.to_not change { Post.count }
    expect(current_path).to eq("/users/1/posts/new")
  end

  scenario 'leaves link empty' do
    expect { add_post(post_link: '') }.to_not change { Post.count }
    expect(current_path).to eq("/users/1/posts/new")
  end

end
