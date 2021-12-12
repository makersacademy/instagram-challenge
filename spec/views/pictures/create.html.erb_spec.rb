require 'rails_helper'

RSpec.describe "pictures/create.html.erb", type: :view do
  pending 
  it 'displays an create new post form' do
    render
    expect(rendered).to have_field('caption')
    # add more here
  end
end
