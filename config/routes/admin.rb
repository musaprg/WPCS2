Rails.application.routes.draw do
  namespace :admin do
    resources :contests do
      resources :editorials
      resources :submissions do
        collection do
          get :fastest_submission
        end
      end

      member do
        get :json_upload
        patch :update_from_json
      end
    end
    resources :problems, :data_sets, only: %i[show new edit create update destroy]
  end
end
