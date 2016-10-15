require 'spec_helper'
require 'rails_helper.rb'

feature 'signup' do
  before(:each) do
    sign_up
  end

  feature 'adding photos' do
    scenario 'user can post photo' do
      add_photo
      expect(page).to have_current_path("/photos")
      expect(page).to have_content("my cat")
    end
  end

end
