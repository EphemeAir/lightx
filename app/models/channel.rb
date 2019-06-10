class Channel < ApplicationRecord

  validates :yt_id, :name, presence: true
  validates :yt_id, :name, uniqueness: true
  validates :yt_id, format: { with: /.{24}/,
                           message: "Please try a valid channel id" }

  belongs_to :user
  has_many :videos, dependent: :destroy

  # def self.from_yt(yt_id)
  # # Either create a User record or update it based on the provider (Google) and the UID
  #   where(yt_id: yt_id).first_or_create do |channel|
  #     yt_channel = Yt::Channel.new id: channel.yt_id
  #     channel.name = yt_channel.title
  #     channel.description = yt_channel.description
  #     channel.thumbnail_url = yt_channel.thumbnail_url
  #     channel.published_at = yt_channel.published_at
  #   end
  # end

end
