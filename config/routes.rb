# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'

  devise_for :users

  get ':id', to: 'dashboard#show', as: :user
end
