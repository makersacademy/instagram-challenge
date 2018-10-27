# frozen_string_literal: true

# require './spec/helpers/web_helpers'
require 'rails_helper'

def register
  sign_up
  expect(page).to have_content('You have successfully signed up!')
end
