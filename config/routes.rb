Rails.application.routes.draw do
  resources :element_properties
  resources :elements
  resources :pages do
    resources :page_elements
  end

  root 'static_pages#home'
end
