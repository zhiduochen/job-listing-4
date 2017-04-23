Rails.application.routes.draw do
  devise_for :users

    resources :jobs

    namespace :admin do
      resources :jobs do
        member do
          post :publish
          post :hide
        end
        resources :resumes
      end
    end


    resources :jobs do
      resources :resumes
    end

    root 'welcome#index'

    get 'about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
