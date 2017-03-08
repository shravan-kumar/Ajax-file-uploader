Rails.application.routes.draw do
  get 'employee/index'

  get 'employee/import'

  root 'welcome#index'

  get 'welcome/upload'
end
