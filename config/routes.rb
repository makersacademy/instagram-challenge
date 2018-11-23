# frozen_string_literal: true

Rails.application.routes.draw do
  root 'user#new'
  resources :user
end
