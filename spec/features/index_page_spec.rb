require "rails_helper"

RSpec.feature "Hello World", type: :feature do
  it 'displays hello world' do
    visit('/')
    expect(page).to have_content('hello world')
  end
end