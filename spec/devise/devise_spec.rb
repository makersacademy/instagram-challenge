# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  before(:each) do
    @account = Account.create { :account }
    controller.stub(:authenticate_account!).and_return(true)
    sign_in @account
  end

  it 'should have a current_user' do
    expect(@account).to_not eq(nil)
  end

end
