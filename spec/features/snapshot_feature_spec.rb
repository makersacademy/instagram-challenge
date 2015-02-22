require 'rails_helper'

feature 'snapshots' do

  before do
    sign_up('test')
  end

  context 'adding a new snapshot' do

    it 'should display a post a new snapshot link to a signed in user' do
      expect(page).to have_link 'Add a new Snapshot!'
    end

    it 'should accept a title for the Snapshot' do
      click_link 'Add a new Snapshot!'
      expect(page).to have_field('Title')
    end

    it 'should successfully save a new snapshot' do
      click_link 'Add a new Snapshot!'
      fill_in('Title', with: 'My first Snapshot!')
      click_button('Post your Snapshot!')
      expect(Post.count).to eq(1)
    end


  end

end
