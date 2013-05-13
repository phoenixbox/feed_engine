FeedEngine::Application.routes.draw do
  # match '', to: 'users#show', constraints: {subdomain: /.+/}
  resources :feed_items
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match '', to: 'users#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  root :to => "home#show"
end
