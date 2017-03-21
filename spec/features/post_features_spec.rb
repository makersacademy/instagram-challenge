require 'rails_helper'

feature 'Posts' do

  include WebHelper

  context 'on main page' do
    before(:each) do
      @time_first = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))
      @time_last  = Timecop.freeze(Time.local(2017, 2, 26, 12, 0, 0))

      @user = User.create(email: "khicks@test.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post_one = Post.create(user_id: @user.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_first)

      @post_two = Post.create(user_id: @user.id,
                      caption: "And another!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_last)
    end

    scenario 'appear with image' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      expect(page).to have_css("img")
    end

    scenario 'appear with user email' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      expect(page).to have_content("khicks@test.com")
    end

    scenario 'appear with timestamp' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      expect(page).to have_content("25 February, 2017")
    end

    scenario 'appear in reverse chronological order' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      expect("26 February, 2017").to appear_before("25 February, 2017")
    end
  end

  context 'on individual pages' do
    before(:each) do
      @time_first = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))
      @time_last  = Timecop.freeze(Time.local(2017, 2, 26, 12, 0, 0))

      @user = User.create(email: "khicks@test.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post_one = Post.create(user_id: @user.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_first)

      @post_two = Post.create(user_id: @user.id,
                      caption: "And another!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_last)
    end

    scenario 'have a like button' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      page.first(".post-link").click
      expect(page).to have_selector(:link_or_button, 'Like')
    end

    scenario 'have a comment button' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      page.first(".post-link").click
      expect(page).to have_selector(:link_or_button, 'Comment')
    end

    scenario 'show the caption' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      page.first(".post-link").click
      expect(page).to have_content("And another!")
    end

  end

  context 'on creation' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user = User.create(email: "khicks@test.com",
                      password: "123456",
                      password_confirmation: "123456")
    end

    scenario 'should have a field for image selection' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      click_link 'Add post'
      expect(page).to have_field "Image"
    end

    scenario 'should have a field for entering caption' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      click_link 'Add post'
      expect(page).to have_field "Caption"
    end

    scenario 'should be added to the database' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      expect { add_post("spec/assets/test_canyon.jpg", "Beautiful photo!") }.to change{ Post.count }.by(1)
    end
  end

end
