require 'rails_helper'

RSpec.describe "posts" do
  describe 'when opening the page' do

    before(:each) do
      visit('/posts')
    end

    it "Can view the posts text" do
      expect(page).to  have_field(type: 'textarea', name: 'post[text]')
    end
  end
end
