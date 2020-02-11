# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'

  resources :blogs
  resources :portfolios, except: [:show]

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
