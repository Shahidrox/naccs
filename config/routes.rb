Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs/v1'
  mount Rswag::Api::Engine => '/api-docs/v1'

  namespace :api do
    namespace :v1 do
      resources :vessels
    end
  end
end
