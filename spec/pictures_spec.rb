require 'rails_helper'

RSpec.describe 'Pictures', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit pictures_path
      expect(page).to have_content('_nstagram')
    end
  end
end
