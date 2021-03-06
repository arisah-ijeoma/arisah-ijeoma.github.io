class Track < ActiveRecord::Base
  has_attached_file :audio
  validates :title, :artiste, presence: true
  validates_attachment_presence :audio
  validates_attachment_content_type :audio, content_type: [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
end
