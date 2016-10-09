require 'rails_helper'
require_relative '../web_helper'


feature 'comments' do

  before do
    sign_up
    add_post('Oh look, a cat!', 'cat.jpg')
  end

  scenario 'users can comment on posts' do
      add_comment('That is one nice kitty')
      expect(current_path).to eq posts_path
      expect(page).to have_content 'That is one nice kitty'
  end

end
