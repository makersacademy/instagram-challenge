require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  it { should use_before_action(:authenticate_user!) }
end
