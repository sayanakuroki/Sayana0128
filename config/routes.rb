Rails.application.routes.draw do

  get 'diagnoses/new'
  post 'diagnoses/create'
  get 'diagnoses/result'
  root 'diagnoses#new'
end
