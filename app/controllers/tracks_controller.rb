class TracksController < ApplicationController
  before_action :find_track, only: [:edit, :destroy, :update, :audio_download, :stream, :path_to_track]

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to tracks_path, notice: 'The track has been successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @track.update_attributes(track_params)
      redirect_to tracks_path, notice: "'#{@track.title}' has been successfully updated"
    else
      render :edit
    end
  end

  def audio_download
    file_path = @track.audio_file_name
    if file_path.present?
      send_file path_to_track,
                filename: @track.audio_file_name,
                type: @track.audio_content_type,
                disposition: 'attachment'
    end
  end

  def path_to_track
    file_path = @track.audio_file_name
    send_file "#{Rails.root}/public/system/tracks/audios/000/000/00#{@track.id}/original/#{file_path}"
  end

  def destroy
    @track.destroy
    redirect_to tracks_path, notice: "The track has been successfully deleted"
  end

  private

  def track_params
    params.require(:track).permit(:title, :artiste, :audio)
  end

  def find_track
    @track = Track.find_by(id: params[:id])
  end
end
