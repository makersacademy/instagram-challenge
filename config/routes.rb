# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'welcome#index'
  end

  root to: redirect('/users/sign_in')
end
