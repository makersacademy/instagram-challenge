require 'rails_helper.rb'


feature 'Back to homepage' do

  context 'User can go back to homepage' do

    scenario 'Clicking All posts takes you to homepage' do
      visit '/'
      click_link 'New Post'
      click_button 'Create Post'
      click_link 'All posts'
      expect(page.current_path).to eql('/')
    end

    scenario 'Clicking INSTAGRAM takes you to homepage' do
      visit '/'
      click_link 'New Post'
      click_button 'Create Post'
      click_link 'I N S T A G R A M'
      expect(page.current_path).to eql('/')
    end
  end
end
