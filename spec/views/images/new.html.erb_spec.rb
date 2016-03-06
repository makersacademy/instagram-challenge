require 'rails_helper'

RSpec.describe "images/new.html.erb", type: :view do
  it 'renders the username' do
    assign(:images, [
      @image = Image.new
      ])
    render 
    
    expect(render).to match "Contribute to beauty...or anything really."
    
  end
end
