require 'rails_helper'

RSpec.describe PostsController do
  describe 'GET index' do
    before { get :index }

    it { should render_template 'index' }
  end

  describe 'GET new' do
    before { get :new }

    it { should render_template 'new'}
  end
end
