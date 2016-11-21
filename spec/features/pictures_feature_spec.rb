require 'rails_helper'

feature 'pictures' do
  context 'on the first visit ' do
    scenario 'there should be basic content....' do
    visit('/pictures')
    expect(page).to have_content('No pictures on here yet')
    expect(page).to have_link('Add a photo!')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    end
  end


  context 'posting basics to the home page' do
    before do
      Picture.create(name: 'Seasons greetings')
    end
    scenario 'we should be able to see the posts on the indexpage' do
      visit('/pictures')
      expect(page).to have_content('Seasons greetings')
      expect(page).not_to have_content('No pictures on here yet')
    end
  end


  context 'user adds comment/tweet to homepage' do
    scenario 'using links on page user adds content' do
      visit('/pictures')
      click_link('Add a photo!')
      fill_in 'Name', with: 'Such a great photo!'
      click_button 'Create Picture'
      expect(page).to have_content('Such a great photo!')
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing individul restaurants.' do
    let!(:sup){Picture.create(name:'Sup', comment: 'beems')}
    scenario 'When user clicks on link and is taken to it\'s own page' do
      visit('/pictures')
      click_link('Sup')
      expect(page).to have_content 'Sup'
      expect(page).to have_content 'beems'
      #expect(current_path).to eq '/pictures/#{sup.id}'
      end
    end

    context 'editing posts.' do
      before do
        Picture.create(name: 'Awesome pic!', comment: 'So awesome!')
      end
      scenario 'User decides to change the information that has been inputted' do
        visit ('/pictures')
        click_link 'Edit Awesome pic!'
        fill_in :name, with: 'Terrible pic'
        fill_in :comment, with: 'So terrible!'
        click_button 'Update picture'
        expect(page).to have_content("So terrible!")
        expect(page).to have_content("Terrible pic")
        expect(current_path).to eq "/restaurants"
      end
    end

    context 'deleting posts.' do
      before do
        Picture.create(name: 'Awesome pic!', comment: 'So awesome!')
      end
      scenario 'User wishes to delete one of the inputted posts' do
        visit ('/pictures')
        click_link 'Delete Awesome pic!'
        expect(page).not_to have_content('Awesome pic!')
        expect(page).to have_content('Picture successfully deleted')
      end
    end

end
