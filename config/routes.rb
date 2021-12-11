Rails.application.routes.draw do
  root 'proxy#input'

  get 'proxy/input'
  get 'proxy/output'
end
