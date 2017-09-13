Rails.application.routes.draw do
  root 'splash#index'
  get 'search' => 'splash#index'
end
