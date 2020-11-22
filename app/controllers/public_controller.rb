class PublicController < ApplicationController
  def homepage
    redirect_to dashboard_path if account_signed_in?
  end
end
