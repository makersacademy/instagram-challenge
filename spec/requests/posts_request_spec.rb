require 'rails_helper'

RSpec.describe "Posts", type: :request do
  it 'redirects to posts index' do
    get('/')
    expect(response).to render_template(:index)
  end
end
