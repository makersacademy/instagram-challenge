require 'rails_helper'

describe PhotosController, type: :controller do
  describe 'checking user is logged in before adding photos' do
    it { is_expected.to use_before_action :authenticate_user! }
  end
end
