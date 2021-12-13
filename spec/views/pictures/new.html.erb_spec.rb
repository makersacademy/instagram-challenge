require 'rails_helper'

RSpec.describe "pictures/new.html.erb", type: :view do 
  it 'displays an create new post form' do
    pending
    render
    expect(rendered).to have_field('caption')
    # add more here
  end
end
