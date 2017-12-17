require 'rails_helper'
require 'features_helper'


RSpec.describe "comments/new.html.erb" do

  describe 'when filling in comment section for the post' do

    before(:each) do
      create_comment
    end

    it 'should display confirmation message' do
      expect(page).to have_content('Comment was successfully created.')
    end

    it 'should display comment information' do
      expect(page).to have_contet('Ana', 'Nice Comment')
    end
  end
end
