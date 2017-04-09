Rails.application.routes.draw do

  get '/' => 'home#index'

  get 'signin_get' => 'authentication_system#signin_get'

  get '/signup_get' => 'authentication_system#signup_get'

  post 'authentication_system/sign_in'

  get '/logout' => 'authentication_system#logout'

  get 'sign_in'=> 'authentication_system#sign_in'

  get '/ask_question' => 'home#ask_question'

  get '/questions_asked' => 'home#questions_asked'

  post '/sign_up'  =>  'authentication_system#sign_up'

  get 'find_people' => 'home#find_people'
  get 'home/particular_question'

  get 'home/follow'

  get 'home/unfollow'

  get '/all_questions'=>'home#all_questions'

  get 'home/follow_question'

  get '/home/unfollow_question'

  get 'home/search'

  get'home/question_upvote'

  get 'home/question_downvote'

  get 'home/give_answer'

  post 'question_follow_mapping' => 'home#question_follow_mapping_json'
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
