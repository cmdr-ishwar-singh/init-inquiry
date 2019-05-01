InitInquiry::Engine.routes.draw do

  root 'inquiries#index'	
  get '/inquiries/:id/update' , to: 'inquiries#update' , as: 'update'
  resources :inquiries
end
