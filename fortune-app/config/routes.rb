Rails.application.routes.draw do
  get '/fortune_url' => 'pages#fortune'
  get '/lotto_url' => 'pages#lotto_action'
  get '/count_url' => 'pages#count_action'
end
