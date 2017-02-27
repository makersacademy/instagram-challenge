require 'rails_helper'

feature 'Instapics' do
  context 'sharing pictures' do
    scenario 'pictures can be uploaded and shared with description filling up a form' do
      sign_up
      share_instapic
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'Brunch for dinner!'
      expect(page).to have_http_status(200)
    end

    scenario 'the author nickname appear above the picture' do
      sign_up
      share_instapic
      expect(current_path).to eq '/instapics'
      expect(page).to have_content 'MakerJenny'
    end

  end

end
