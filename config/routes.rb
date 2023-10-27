Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/teacher', to: 'teachers#show'

  get '/teachers_index', to: 'teachers#index'

  post '/teacher_create', to: 'teachers#create'

  get '/schools_index', to: 'schools#index'

  post '/parent_create', to: 'parents#create'
end
