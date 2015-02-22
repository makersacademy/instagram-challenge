require 'rails_helper'

feature 'displaying a post' do

  context 'selecting a post to view' do

    it 'should have a link to see post in more detail' do
      sign_up('test')
      new_post('this is a post')
      expect(page).to have_link('View post in more detail')
    end

  end
end
