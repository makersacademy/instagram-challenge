require 'rails_helper'
require_relative '../helpers/sign_helpers.rb'

feature 'Likes' do

  context 'on main page' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user_one = User.create(email: "mitch@gmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @user_two = User.create(email: "example@hotmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @image = Image.create(user_id: @user_one.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'),
                      created_at: @time)
    end

    scenario 'appear with image' do
      signup1
      visit '/'
      expect(page).to have_content "0 likes"
    end

    scenario 'appear with correct pluralisation' do
      signup1
      visit '/'
      # page.first(".image-link").click
      click_link 'Like'
      expect(page).to have_content "1 like"
    end
  end

  context 'on individual pages' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user_one = User.create(email: "mitch@gmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @user_two = User.create(email: "example@hotmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @image = Image.create(user_id: @user_one.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'),
                      created_at: @time)
    end

    scenario 'can be added' do
      sign_in("maggie_a_hicks@hotmail.com", "123456")
      visit '/'
      page.first(".image-link").click
      expect { click_link 'Like' }.to change{ Like.count }.by(1)
    end

    scenario 'cannot be added if user likes own image' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      page.first(".image-link").click
      click_link 'Like'
      expect(page).to have_content("You cannot like your own image")
    end

    scenario 'cannot be added if user has already liked image' do
      sign_in("maggie_a_hicks@hotmail.com", "123456")
      visit '/'
      page.first(".image-link").click
      click_link 'Like'
      page.first(".image-link").click
      click_link 'Like'
      expect(page).to have_content("You cannot like a image more than once")
    end
  end

end
