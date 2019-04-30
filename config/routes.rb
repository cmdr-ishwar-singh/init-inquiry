InitInquiry::Engine.routes.draw do
  get '/inquiries/:id/update' , to: 'inquiries#update' , as: 'update'
  resources :inquiries
end
