require 'rails_helper'

RSpec.describe "ideas/new.html.erb" do

  describe 'when opening the page' do

    before(:each) do
      visit('/ideas/new')
      fill_in(id: 'idea_name', with: 'Brilliant Idea')
      fill_in(id: 'idea_description', with: 'Brilliant Description')
      click_button('Create Idea')
    end

    it 'has content of new idea' do
      expect(page).to have_content('Brilliant Idea', 'Brilliant Description')
    end
  end
end
