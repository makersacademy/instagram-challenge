require 'rails_helper'

RSpec.describe 'Pictures', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit pictures_index_path
      sleep(5)
      expect(page).to have_content('Pictures#index')
    end
  end
end
