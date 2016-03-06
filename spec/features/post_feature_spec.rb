require 'rails_helper'

feature 'Uploading and Viewing posts' do
  scenario 'no posts yet' do
    visit '/'
    expect(page).to have_content 'No posts, upload one!'
  end

  context 'uploading posts' do
    before do
      sign_up
    end

    scenario 'user can upload posts' do
      make_a_post
      expect(current_path).to eq '/posts'
      within('li.posts') do
        expect(page).to have_content 'test@email.com'
        expect(page).to have_selector("img[src*='testpattern.jpg']")
        expect(page).to have_content 'Test caption'
      end
    end

    feature 'displays time posted' do
      scenario 'a post made 5 hours ago shows it is posted 5 hours ago' do
        time_now = Time.now
        allow(Time).to receive(:now).and_return(time_now - 5.hours)
        make_a_post
        allow(Time).to receive(:now).and_return(time_now)
        visit '/'
        expect(page).to have_content('posted about 5 hours ago')
      end
    end
  end
end
