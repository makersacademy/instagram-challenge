require 'rails_helper'

feature 'Likes' do

  include WebHelper

  context 'on main page' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user_one = User.create(email: "kmhicks92@gmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @user_two = User.create(email: "maggie_a_hicks@hotmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post = Post.create(user_id: @user_one.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time)
    end

    scenario 'appear with post' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      expect(page).to have_content "0 likes"
    end

    scenario 'appear with correct pluralisation' do
      sign_in("maggie_a_hicks@hotmail.com", "123456")
      visit '/'
      page.first(".post-link").click
      click_link 'Like'
      expect(page).to have_content "1 like"
    end
  end

  context 'on individual pages' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user_one = User.create(email: "kmhicks92@gmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @user_two = User.create(email: "maggie_a_hicks@hotmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post = Post.create(user_id: @user_one.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time)
    end

    scenario 'can be added' do
      sign_in("maggie_a_hicks@hotmail.com", "123456")
      visit '/'
      page.first(".post-link").click
      expect { click_link 'Like' }.to change{ Like.count }.by(1)
    end

    scenario 'cannot be added if user likes own post' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      page.first(".post-link").click
      click_link 'Like'
      expect(page).to have_content("You cannot like your own post")
    end

    scenario 'cannot be added if user has already liked post' do
      sign_in("maggie_a_hicks@hotmail.com", "123456")
      visit '/'
      page.first(".post-link").click
      click_link 'Like'
      page.first(".post-link").click
      click_link 'Like'
      expect(page).to have_content("You cannot like a post more than once")
    end
  end

end
