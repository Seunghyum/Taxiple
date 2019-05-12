Rails.application.routes.draw do
  devise_for :users, :controllers  => {:sessions => 'my_devise/sessions',
                                       :registrations => 'my_devise/registrations', 
                                       :confirmations => 'my_devise/confirmations',
                                       :passwords => 'my_devise/passwords'}
  match "/:controller(/:action(/:id))", :via => [:post, :get]
  root "taxiple#page4"
  # devise_scope :user do
  #   root to: "my_devise/sessions#new"
  # end
end
