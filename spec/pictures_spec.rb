require 'rails_helper'

RSpec.describe 'Pictures', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit pictures_path
      sleep(2)
      expect(page).to have_content('Pictures#index')
    end
  end
end
