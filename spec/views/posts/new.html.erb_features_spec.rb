require 'rails_helper'

RSpec.describe "posts/new.html.erb" do
  describe 'when creating a new post' do

    before(:each) do
      visit('/posts/new')
    end

    # it "has content New Post" do
    #   expect(page).to have_content('New Post')
    # end
    #
    # it 'has a name field' do
    #   expect(page).to  have_field(type: 'textarea', name: 'post[text]')
    # end
    #
    # it 'has a submit button' do
    #   expect(page).to have_button(value: 'Save Post')
    # end

  end
end
