Rails.application.routes.draw do
  root 'home#index'
  get '/using_partial', to: 'home#using_partial'
  get '/using_view_component', to: 'home#using_view_component'
end
