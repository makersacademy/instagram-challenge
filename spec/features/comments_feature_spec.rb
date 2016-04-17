require 'rails_helper'

feature 'Adding comments' do

  context 'a moment has been added' do
    before do
      share_a_moment
    end
    scenario 'a user can comment on moment' do
      add_a_comment
      expect(page).to have_content('That is profound')
    end
  end
end
