Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'commits/:organization_id/:repo_id/:sha', to: 'commits#show'
      get 'commits/:organization_id/:repo_id', to: 'commits#index'
      get "/repos/:organization_id/:repository_id/issues" => "repos#all_issues"
      get "/repos/:organization_id/:repository_id/open_issues" => "repos#open_issues"
      get "/repos/:organization_id/:repository_id/closed_issues" => "repos#closed_issues"
      get "/repos/:organization_id/:repository_id/pull_requests" => "repos#all_pull_requests"
      get "/repos/:organization_id/:repository_id/open_pull_requests" => "repos#open_pull_requests"
      get "/repos/:organization_id/:repository_id/closed_pull_requests" => "repos#closed_pull_requests"
      get "/repos/:organization_id/:repository_id/branches" => "repos#branches"
      get "/repos/:organization_id/:repository_id/commits" => "repos#commits"
      get "/repos/:organization_id/:repository_id/stats" => "repos#stats"
      get "/repos/:organization_id/:repository_id/contributors" => "repos#contributors"
      resources :organizations, only: [:show, :issues_info] do
        get :commits, on: :member
        get :issues, on: :member
        get :pull_requests, on: :member
        get :issues_info, on: :member
        get :pull_requests_info, on: :member
        get :repositories_info, on: :member
        get :stats, on: :member
        get :members, on: :member
        resources :repositories, only: [:index, :show]
      end
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
