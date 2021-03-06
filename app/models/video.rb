class Video < ApplicationRecord

  validates :yt_id, :name, presence: true
  validates :yt_id, uniqueness: true

  belongs_to :channel
  has_many :video_topics
  has_many :topics, through: :video_topics

    def self.from_yt(yt_id)
   # Either create a User record or update it based on the provider (Google) and the UID
    where(yt_id: yt_id).first_or_create do |video|
      yt_video = Yt::Video.new id: video.yt_id
      video.name = yt_video.title
      video.description = yt_video.description
      video.thumbnail_url = yt_video.thumbnail_url
      video.duration = yt_video.duration
      video.captioned = yt_video.captioned?
      video.published_at = yt_video.published_at

      # raise
   end
  end

end
