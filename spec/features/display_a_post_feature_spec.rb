require 'rails_helper'

feature 'displaying a post' do

  context 'selecting a post to view' do

    it 'should have a link to see post in more detail' do
      sign_up('test')
      new_post('this is a post')
      expect(page).to have_link('View post in more detail')
    end

    it 'should take you to a page with the post in more detail' do
      sign_up('test')
      new_post('this is a post')
      click_link('Sign out')
      click_link('View post in more detail')
      expect(current_path).to include('/posts/')
      expect(page).to have_content('this is a post')
      expect(page).to have_content('posted by test@example.com')
    end

    it 'should display and all comments' do
      sign_up('test')
      new_post('this is a post')
      add_comment('this is what I think about this Snapshot!')
      click_link('Sign out')
      click_link('View post in more detail')
      expect(page).to have_content('this is what I think about this Snapshot!')
    end

  end
end
