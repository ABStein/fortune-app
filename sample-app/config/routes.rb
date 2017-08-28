Rails.application.routes.draw do
  get '/hello_url' => 'pages#hello_action'
  get '/viking_url' => 'pages#viking_action'
  get '/panda_url' => 'pages#panda_action'
  get '/ninja_url' => 'pages#ninja_action'
  get '/toy_url' => 'pages#toy_action'
  get '/time_url' => 'pages#time_action'
end
