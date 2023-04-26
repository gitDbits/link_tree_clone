# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'appearance', to: 'dashboard#appearance'

  get ':id', to: 'dashboard#show', as: :user
end
