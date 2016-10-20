Rails.application.routes.draw do
  root 'tracks#index'
  resources :tracks
  match 'tracks/audio_download/:id', to: 'tracks#audio_download', via: :get, as: :audio_download
  Track.all.each do |track|
    get "/system/tracks/audios/000/000/00#{track.id}/original/#{track.audio_file_name}", to: "tracks#path_to_track"
  end
end
