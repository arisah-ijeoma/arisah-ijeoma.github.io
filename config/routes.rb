Rails.application.routes.draw do
  root 'tracks#index'
  resources :tracks
  match 'tracks/audio_download/:id', to: 'tracks#audio_download', via: :get, as: :audio_download
  get '/tracks/play/:id', to: 'tracks#stream', as: :stream
end
