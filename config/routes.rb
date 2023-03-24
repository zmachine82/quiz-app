Rails.application.routes.draw do
  get '/quiz_tests/:id/take', to: 'quizzing#take_test'
  post '/quiz_tests/:id/submit', to: 'quizzing#submit_test'
  resources :quiz_tests
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
